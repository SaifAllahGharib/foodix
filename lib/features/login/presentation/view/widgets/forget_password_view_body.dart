import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/routing/app_route_name.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../../../../../core/shared/functions/snack_bar.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../../core/widgets/loading.dart';
import '../../viewmodel/cubits/forget_password/forget_password_cubit.dart';
import '../../viewmodel/cubits/forget_password/forget_password_state.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
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
    context.navigator.pushNamed(
      AppRouteName.verification,
      arguments: {"user": user, "purpose": "forget_password"},
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
          color: AppColors.primary,
        );

        _onSuccess(user);
      } else if (msg == "Not send code success") {
        snackBar(context: context, text: "code_not_send_success");

        _onSuccess(user);
      } else if (msg == "User not found") {
        snackBar(context: context, text: "this_user_does_not_exist");
      }
    } else if (state is ForgetPasswordFailure) {
      snackBar(context: context, text: "Error: ${state.errorMsg}");
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
          padding: EdgeInsets.all(context.responsive.height20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                context.responsive.height20.verticalSpace,
                const CustomBackButton(),
                context.responsive.height30.verticalSpace,
                Text(context.tr.rePassword),
                context.responsive.height90.verticalSpace,
                AppTextFormField(
                  controller: _email,
                  label: context.tr.labelEmail,
                  hint: context.tr.hintEmail,
                  onChanged: (val) => context
                      .read<ForgetPasswordCubit>()
                      .validationFields(email: _email),
                ),
                context.responsive.height30.verticalSpace,
                AppButton(
                  text: context.tr.verify,
                  isEnabled: context.watch<ForgetPasswordCubit>().buttonEnabled,
                  onClick: () {
                    context.read<ForgetPasswordCubit>().forgetPassword(
                      _email.text,
                    );
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
