import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/services/firebase_service.dart';
import 'package:foodix/core/utils/assets.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/utils/functions/snack_bar.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/widgets/custom_button.dart';
import 'package:foodix/features/home/presentation/view/home_view.dart';
import 'package:foodix/features/verification/presentation/view/widgets/success_verification_widget.dart';
import 'package:foodix/features/verification/presentation/viewmodel/cubits/verification/verification_cubit.dart';
import 'package:foodix/features/verification/presentation/viewmodel/cubits/verification/verification_state.dart';
import 'package:go_router/go_router.dart';

class VerificationViewBody extends StatefulWidget {
  final String email;

  const VerificationViewBody({super.key, required this.email});

  @override
  State<VerificationViewBody> createState() => _VerificationViewBodyState();
}

class _VerificationViewBodyState extends State<VerificationViewBody> {
  late final StreamController<bool> _verificationController;
  late final FirebaseService _firebaseService;
  Timer? _timer;

  @override
  void initState() {
    _firebaseService = FirebaseService();
    _verificationController = StreamController.broadcast();
    _sendEmailVerification(context);
    _startVerificationListener(context);
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    _verificationController.close();
    super.dispose();
  }

  void _pushToHomeView() async {
    await Future.delayed(const Duration(seconds: 2));
    GoRouter.of(context).go(HomeView.id);
  }

  void _handelState(BuildContext context, state) async {
    if (state is VerificationIsEmailVerificationSend) {
      snackBar(
        context: context,
        text: context.translate.sendToEmailSuccess,
        color: AppColors.primaryColor,
      );
    } else if (state is VerificationSuccess) {
      _pushToHomeView();
    } else if (state is VerificationFailure) {
      snackBar(context: context, text: "Error: ${state.errorMsg}");
    }
  }

  void _sendEmailVerification(BuildContext context) {
    context.read<VerificationCubit>().sendEmailVerification();
  }

  void _startVerificationListener(BuildContext context) {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      final user = _firebaseService.auth.currentUser;
      await user?.reload();
      if (user != null && user.emailVerified && mounted) {
        _isEmailVerified(context);
        _verificationController.add(true);
        timer.cancel();
      }
    });
  }

  void _isEmailVerified(BuildContext context) {
    context.read<VerificationCubit>().isEmailVerified();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) => _handelState(context, state),
      builder: (context, state) {
        return StreamBuilder<bool>(
          stream: _verificationController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data == true) {
              return const SuccessVerificationWidget();
            }

            return Padding(
              padding: EdgeInsets.all(Dimensions.height20),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: Dimensions.height30),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      spacing: Dimensions.width20,
                      runSpacing: Dimensions.height10 * 0.3,
                      children: [
                        Text(
                          context.translate.sendLinkVerificationYourEmailTo,
                          style: Styles.textStyle16(context),
                        ),
                        Text(
                          widget.email,
                          style: Styles.textStyle12(
                            context,
                          ).copyWith(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height20),
                    Image.asset(Assets.verify),
                    const Spacer(),
                    CustomButton(
                      text: context.read<VerificationCubit>().time != 0
                          ? "${context.read<VerificationCubit>().time}s"
                          : context.translate.resendEmail,
                      isEnabled: context.read<VerificationCubit>().canSend,
                      onClick: () => _sendEmailVerification(context),
                    ),
                    SizedBox(height: Dimensions.height30),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
