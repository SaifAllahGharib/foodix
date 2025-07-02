import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/services/firebase_service.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/app_button.dart';
import 'package:foodix/core/widgets/app_text_form_field.dart';
import 'package:foodix/core/widgets/custom_text_button.dart';
import 'package:foodix/core/widgets/loading.dart';
import 'package:foodix/features/home/presentation/view/home_view.dart';
import 'package:foodix/features/login/data/models/login_model.dart';
import 'package:foodix/features/login/presentation/view/forgot_password_view.dart';
import 'package:foodix/features/login/presentation/viewmodel/cubits/login/login_cubit.dart';
import 'package:foodix/features/login/presentation/viewmodel/cubits/login/login_state.dart';
import 'package:foodix/features/verification/presentation/view/verification_view.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../choose_role/presentation/view/choose_role_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  bool _isEmailVerified() {
    FirebaseService firebaseService = FirebaseService();
    return firebaseService.auth.currentUser?.emailVerified ?? false;
  }

  void _onSuccess(state) {
    if (state.msg == context.tr.success) {
      if (_isEmailVerified()) {
        context.navigator.go(HomeView.id);
      } else {
        context.navigator.push(VerificationView.id, extra: _email.text);
      }
    }
  }

  void _onFailure(state) {
    if (state.failure is FirebaseAuthFailure) {
      final String msg = state.failure.errorMsg;
      if (msg == "user-not-found") {
        snackBar(context: context, text: context.tr.thisUserDoesNotExist);
      } else if (msg == "wrong-password") {
        snackBar(context: context, text: context.tr.passwordIncorrect);
      } else {
        snackBar(context: context, text: msg);
      }
    } else {
      snackBar(context: context, text: state.failure.errorMsg);
    }
  }

  void _handelState(state) async {
    if (state is LoginSuccess) {
      _onSuccess(state);
    } else if (state is LoginFailure) {
      _onFailure(state);
    }
  }

  void _validation(BuildContext context) {
    context.read<LoginCubit>().validationFields(
      email: _email,
      password: _password,
    );
  }

  void _login(BuildContext context) {
    context.read<LoginCubit>().login(
      LoginModel(email: _email.text.trim(), password: _password.text.trim()),
      context.tr.success,
      context.tr.field,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) => _handelState(state),
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Loading();
        }

        return Padding(
          padding: EdgeInsets.all(context.responsive.height20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Dimensions.height30),
                CustomText(text: context.tr.welcomeBack),
                SizedBox(height: Dimensions.height45 * 2),
                AppTextFormField(
                  controller: _email,
                  label: context.tr.labelEmail,
                  hint: context.tr.hintEmail,
                  onChanged: (val) => _validation(context),
                ),
                SizedBox(height: context.responsive.height15),
                AppTextFormField(
                  controller: _password,
                  label: context.tr.labelPass,
                  isPassword: true,
                  hint: context.tr.hintPass,
                  onPressedShowPassword: context
                      .read<LoginCubit>()
                      .togglePasswordVisibility,
                  showPassword: context.watch<LoginCubit>().showPassword,
                  onChanged: (val) => _validation(context),
                ),
                context.responsive.height10.verticalSpace,
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextButton(
                    text: context.tr.forgetPass,
                    onClick: () {
                      context.navigator.push(ForgotPasswordView.id);
                    },
                  ),
                ),
                SizedBox(height: Dimensions.height30),
                AppButton(
                  text: context.tr.login,
                  isEnabled: context.watch<LoginCubit>().buttonEnabled,
                  onClick: () => _login(context),
                ),
                context.responsive.height20.verticalSpace,
                CustomTextButton(
                  text: context.tr.notHaveAccount,
                  color: Colors.black,
                  onClick: () {
                    context.navigator.push(ChooseRoleView.id);
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
