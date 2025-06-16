import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/functions/snack_bar.dart';
import 'package:foodix/core/widgets/custom_back_button.dart';
import 'package:foodix/core/widgets/custom_button.dart';
import 'package:foodix/core/widgets/custom_text.dart';
import 'package:foodix/core/widgets/custom_text_field.dart';
import 'package:foodix/core/widgets/loading.dart';
import 'package:foodix/features/login/presentation/viewmodel/cubits/forget_password/forget_password_cubit.dart';
import 'package:foodix/features/login/presentation/viewmodel/cubits/forget_password/forget_password_state.dart';
import 'package:foodix/features/verification/presentation/view/verification_view.dart';
import 'package:foodix/generated/l10n.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  late final TextEditingController _email;

  @override
  void initState() {
    _email = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();

    super.dispose();
  }

  void _onSuccess(user) {
    GoRouter.of(context).push(
      VerificationView.id,
      extra: {
        "user": user,
        "purpose": "forget_password",
      },
    );
  }

  void _handleState(state) {
    if (state is ForgetPasswordSuccess) {
      final msg = state.response.message;
      final user = state.response.user;

      if (msg == "Send code successfully") {
        snackBar(
          context: context,
          text: "code_send_successfully",
          color: AppColors.primaryColor,
        );

        _onSuccess(user);
      } else if (msg == "Not send code success") {
        snackBar(
          context: context,
          text: "code_not_send_success",
        );

        _onSuccess(user);
      } else if (msg == "User not found") {
        snackBar(
          context: context,
          text: "this_user_does_not_exist",
        );
      }
    } else if (state is ForgetPasswordFailure) {
      snackBar(
        context: context,
        text: "Error: ${state.errorMsg}",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) => _handleState(state),
      builder: (context, state) {
        if (state is ForgetPasswordLoading) {
          return const Loading();
        }

        return Padding(
          padding: EdgeInsets.all(Dimensions.height20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Dimensions.height20),
                const CustomBackButton(),
                SizedBox(height: Dimensions.height30),
                CustomText(text: "re_password"),
                SizedBox(height: Dimensions.height45 * 2),
                CustomTextField(
                  controller: _email,
                  hint: S.of(context).hintEmail,
                  onChanged: (val) => context
                      .read<ForgetPasswordCubit>()
                      .validationFields(email: _email),
                ),
                SizedBox(height: Dimensions.height30),
                CustomButton(
                  text: "verify",
                  isEnabled: context.watch<ForgetPasswordCubit>().buttonEnabled,
                  onClick: () {
                    context
                        .read<ForgetPasswordCubit>()
                        .forgetPassword(_email.text);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
