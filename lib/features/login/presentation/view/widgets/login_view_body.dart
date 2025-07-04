import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/di/dependency_injection.dart';
import 'package:foodix/core/routing/app_route_name.dart';
import 'package:foodix/core/services/firebase_service.dart';
import 'package:foodix/core/shared/page_state.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/app_button.dart';
import 'package:foodix/core/widgets/app_text_form_field.dart';
import 'package:foodix/core/widgets/custom_text_button.dart';
import 'package:foodix/core/widgets/loading.dart';
import 'package:foodix/features/login/data/models/login_model.dart';
import 'package:foodix/features/login/presentation/viewmodel/cubits/login/login_cubit.dart';
import 'package:foodix/features/login/presentation/viewmodel/cubits/login/login_state.dart';

import '../../../../../core/shared/functions/snack_bar.dart';

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
    return getIt<FirebaseService>().auth.currentUser?.emailVerified ?? false;
  }

  void _handleState(LoginState state) {
    final status = state.status;

    if (status is PageSuccess) {
      if (_isEmailVerified()) {
        context.navigator.pushNamedAndRemoveUntil(
          AppRouteName.home,
          (route) => false,
        );
      } else {
        context.navigator.pushNamed(AppRouteName.verification);
      }
    } else if (status is PageFailure) {
      final msg = status.message;
      if (msg == "user_not_found") {
        snackBar(context: context, text: context.tr.thisUserDoesNotExist);
      } else if (msg == "wrong_password") {
        snackBar(context: context, text: context.tr.passwordIncorrect);
      } else {
        snackBar(context: context, text: msg);
      }
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
      listener: (context, state) => _handleState(state),
      builder: (context, state) {
        if (state.status is PageLoading) {
          return const Loading();
        }

        return Padding(
          padding: EdgeInsets.all(context.responsive.height20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                context.responsive.height30.verticalSpace,
                Text(context.tr.welcomeBack, style: context.textStyle.s30W600),
                context.responsive.height90.verticalSpace,
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
                  onChanged: (val) => _validation(context),
                ),
                context.responsive.height10.verticalSpace,
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextButton(
                    text: context.tr.forgetPass,
                    onClick: () {
                      context.navigator.pushNamed(AppRouteName.forgotPassword);
                    },
                  ),
                ),
                context.responsive.height30.verticalSpace,
                AppButton(
                  text: context.tr.login,
                  isEnabled: state.buttonEnabled,
                  onClick: () => _login(context),
                ),
                context.responsive.height20.verticalSpace,
                CustomTextButton(
                  text: context.tr.notHaveAccount,
                  color: Colors.black,
                  onClick: () {
                    context.navigator.pushNamed(AppRouteName.chooseRole);
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
