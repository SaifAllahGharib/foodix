import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/di/dependency_injection.dart';
import 'package:foodix/core/routing/app_route_name.dart';
import 'package:foodix/core/utils/app_assets.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/app_button.dart';
import 'package:foodix/features/verification/presentation/view/widgets/success_verification_widget.dart';
import 'package:foodix/features/verification/presentation/viewmodel/cubits/verification/verification_cubit.dart';
import 'package:foodix/features/verification/presentation/viewmodel/cubits/verification/verification_state.dart';

import '../../../../../core/services/firebase_service.dart';
import '../../../../../core/shared/functions/snack_bar.dart';
import '../../../../../core/shared/page_state.dart';
import '../../../../../core/styles/app_colors.dart';

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
    _firebaseService = getIt<FirebaseService>();
    _verificationController = StreamController.broadcast();
    _sendEmailVerification(context);
    _startVerificationListener(context);
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _verificationController.close();
    super.dispose();
  }

  void _pushToHomeView() async {
    await Future.delayed(const Duration(seconds: 2));
    context.navigator.pushNamedAndRemoveUntil(
      AppRouteName.home,
      (route) => false,
    );
  }

  void _handleState(BuildContext context, VerificationState state) async {
    final status = state.status;
    if (status is PageSuccess<bool>) {
      snackBar(
        context: context,
        text: context.tr.sendToEmailSuccess,
        color: AppColors.primary,
      );
      if (status.data!) {
        _pushToHomeView();
      }
    } else if (status is PageFailure<bool>) {
      snackBar(context: context, text: "Error: ${status.message}");
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
      listener: (context, state) => _handleState(context, state),
      builder: (context, state) {
        return StreamBuilder<bool>(
          stream: _verificationController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data == true) {
              return const SuccessVerificationWidget();
            }

            return Padding(
              padding: EdgeInsets.all(context.responsive.height20),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    context.responsive.height30.verticalSpace,
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      spacing: context.responsive.width20,
                      runSpacing: context.responsive.height3,
                      children: [
                        Text(
                          context.tr.sendLinkVerificationYourEmailTo,
                          style: context.textStyle.s16W500,
                        ),
                        Text(
                          widget.email,
                          style: context.textStyle.s12W400.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    context.responsive.height20.verticalSpace,
                    Image.asset(AppAssets.verify),
                    const Spacer(),
                    AppButton(
                      text: state.time != 0
                          ? "${state.time}s"
                          : context.tr.resendEmail,
                      isEnabled: state.canSend,
                      onClick: () => _sendEmailVerification(context),
                    ),
                    context.responsive.height30.verticalSpace,
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
