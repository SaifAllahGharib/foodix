import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:foodix/core/services/firebase_service.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/functions/snack_bar.dart';
import 'package:foodix/core/widgets/custom_button.dart';
import 'package:foodix/core/widgets/custom_text.dart';
import 'package:foodix/core/widgets/custom_text_button.dart';
import 'package:foodix/core/widgets/custom_text_field.dart';
import 'package:foodix/core/widgets/loading.dart';
import 'package:foodix/features/choose_type/presentation/view/choose_type_view.dart';
import 'package:foodix/features/home/presentation/view/home_view.dart';
import 'package:foodix/features/login/data/models/login_model.dart';
import 'package:foodix/features/login/presentation/view/forget_password_view.dart';
import 'package:foodix/features/login/presentation/viewmodel/cubits/login/login_cubit.dart';
import 'package:foodix/features/login/presentation/viewmodel/cubits/login/login_state.dart';
import 'package:foodix/features/verification/presentation/view/verification_view.dart';
import 'package:foodix/generated/l10n.dart';

import '../../../../../core/errors/failure.dart';

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
    if (state.msg == S.of(context).success) {
      if (_isEmailVerified()) {
        GoRouter.of(context).push(HomeView.id);
      } else {
        GoRouter.of(context).push(
          VerificationView.id,
          extra: _email.text,
        );
      }
    }

    snackBar(
      context: context,
      text: state.msg,
      color: AppColors.primaryColor,
    );
  }

  void _onFailure(state) {
    if (state.failure is FirebaseAuthFailure) {
      final String msg = state.failure.errorMsg;
      if (msg == "user-not-found") {
        snackBar(context: context, text: "this_user_does_not_exist");
      } else if (msg == "wrong-password") {
        snackBar(context: context, text: "password_incorrect");
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
          LoginModel(
            email: _email.text.trim(),
            password: _password.text.trim(),
          ),
          context,
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
          padding: EdgeInsets.all(Dimensions.height20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Dimensions.height30),
                CustomText(text: S.of(context).welcomeBack),
                SizedBox(height: Dimensions.height45 * 2),
                CustomTextField(
                  controller: _email,
                  hint: S.of(context).hintEmail,
                  onChanged: (val) => _validation(context),
                ),
                SizedBox(height: Dimensions.height15),
                CustomTextField(
                  controller: _password,
                  isPassword: true,
                  hint: S.of(context).hintPass,
                  onPressedShowPassword:
                      context.read<LoginCubit>().togglePasswordVisibility,
                  showPassword: context.watch<LoginCubit>().showPassword,
                  onChanged: (val) => _validation(context),
                ),
                SizedBox(height: Dimensions.height10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextButton(
                    text: S.of(context).forgetPass,
                    onClick: () {
                      GoRouter.of(context).push(ForgetPasswordView.id);
                    },
                  ),
                ),
                SizedBox(height: Dimensions.height30),
                CustomButton(
                  text: S.of(context).login,
                  isEnabled: context.watch<LoginCubit>().buttonEnabled,
                  onClick: () {
                    print(_email.text);
                    print(_password.text);
                    _login(context);
                  },
                ),
                SizedBox(height: Dimensions.height20),
                CustomTextButton(
                  text: S.of(context).notHaveAccount,
                  color: Colors.black,
                  onClick: () {
                    GoRouter.of(context).push(ChooseTypeView.id);
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
