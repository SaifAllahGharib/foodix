import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/routing/app_route_name.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/app_button.dart';
import 'package:foodix/core/widgets/app_text_form_field.dart';
import 'package:foodix/core/widgets/loading.dart';
import 'package:foodix/features/login/data/models/change_password_model.dart';
import 'package:foodix/features/login/presentation/viewmodel/cubits/change_password/change_password_cubit.dart';
import 'package:foodix/features/login/presentation/viewmodel/cubits/change_password/change_password_state.dart';

import '../../../../../core/shared/functions/snack_bar.dart';

class ChangePasswordViewBody extends StatefulWidget {
  final String verifyCode;
  final Map<String, dynamic> user;

  const ChangePasswordViewBody({
    super.key,
    required this.verifyCode,
    required this.user,
  });

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  late final TextEditingController _changePassword;
  late final TextEditingController _confirmPassword;

  @override
  void initState() {
    _changePassword = TextEditingController();
    _confirmPassword = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _changePassword.dispose();
    _confirmPassword.dispose();

    super.dispose();
  }

  void _validation(BuildContext context) {
    context.read<ChangePasswordCubit>().validationFields(
      changePassword: _changePassword,
      confirmPassword: _confirmPassword,
    );
  }

  void _handleState(state) async {
    if (state is ChangePasswordSuccess) {
      final msg = state.response.message;

      if (msg == "Password updated successfully") {
        snackBar(
          context: context,
          text: context.tr.changePasswordSuccessful,
          color: AppColors.primary,
        );

        // await getIt<SharedPreferencesService>().storeUser(state.response.user!);

        context.navigator.pushNamedAndRemoveUntil(
          AppRouteName.home,
          (route) => false,
        );
      } else if (msg == "Failed to update password") {
        snackBar(context: context, text: context.tr.changePasswordFailed);
      }
    } else if (state is ChangePasswordFailure) {
      snackBar(context: context, text: "Error: ${state.errorMsg}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) => _handleState(state),
      builder: (context, state) {
        if (state is ChangePasswordLoading) {
          return const Loading();
        }

        return Padding(
          padding: EdgeInsets.all(context.responsive.height20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                context.responsive.height45.verticalSpace,
                Text(
                  context.tr.changePassword,
                  style: context.textStyle.s30W600,
                ),
                context.responsive.height90.verticalSpace,
                AppTextFormField(
                  controller: _changePassword,
                  label: context.tr.labelPass,
                  isPassword: true,
                  hint: context.tr.hintPass,
                  onChanged: (val) => _validation(context),
                ),
                SizedBox(height: context.responsive.height15),
                AppTextFormField(
                  controller: _confirmPassword,
                  label: context.tr.labelConfPass,
                  isPassword: true,
                  hint: context.tr.hintPass,
                  onChanged: (val) => _validation(context),
                ),
                context.responsive.height30.verticalSpace,
                AppButton(
                  text: context.tr.verify,
                  isEnabled: context.watch<ChangePasswordCubit>().buttonEnabled,
                  onClick: () =>
                      context.read<ChangePasswordCubit>().changePassword(
                        ChangePasswordModel(
                          email: widget.user["email"],
                          password: _confirmPassword.text,
                          verifyCode: widget.verifyCode,
                        ),
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
