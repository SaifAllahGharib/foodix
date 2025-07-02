import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/app_button.dart';
import 'package:foodix/core/widgets/custom_backets/app_button.dart';
import 'package:foodix/core/widgets/custom_text_button.dart';
import 'package:foodix/core/widgets/loading.dart';
import 'package:foodix/features/login/presentation/view/login_view.dart';
import 'package:foodix/features/signup/data/models/signup_model.dart';
import 'package:foodix/features/signup/presentation/view/widgets/column_of_text_fields.dart';
import 'package:foodix/features/signup/presentation/viewmodel/cubits/signup/signup_cubit.dart';
import 'package:foodix/features/signup/presentation/viewmodel/cubits/signup/signup_state.dart';
import 'package:foodix/features/verification/presentation/view/verification_view.dart';

class SignupViewBody extends StatefulWidget {
  final String role;

  const SignupViewBody({super.key, required this.role});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _phone;
  late final TextEditingController _password;

  @override
  void initState() {
    _name = TextEditingController();
    _email = TextEditingController();
    _phone = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    super.dispose();
  }

  void _pushToVerificationView() {
    context.navigator.push(VerificationView.id, extra: _email.text);
  }

  void _onSuccess(state) {
    if (state.msg == context.tr.success) {
      _pushToVerificationView();
    }
  }

  void _onFailure(state) {
    if (state.failure is FirebaseAuthFailure) {
      final String msg = state.failure.errorMsg;

      if (msg == "weak-password") {
        snackBar(context: context, text: context.tr.weakPassword);
      } else if (msg == "email-already-in-use") {
        snackBar(context: context, text: context.tr.userAlreadyExists);
      }
    } else {
      snackBar(context: context, text: state.failure.errorMsg);
    }
  }

  void _handelState(state) {
    if (state is SignupSuccess) {
      _onSuccess(state);
    } else if (state is SignupFailure) {
      _onFailure(state);
    }
  }

  void _signup(BuildContext context) async {
    context.read<SignupCubit>().signup(
      SignupModel(
        name: _name.text,
        email: _email.text,
        phone: _phone.text,
        password: _password.text,
        role: widget.role,
      ),
      context.tr.success,
      context.tr.field,
    );
  }

  void _validation(BuildContext context) {
    context.read<SignupCubit>().validationFields(
      name: _name,
      email: _email,
      phone: _phone,
      password: _password,
      userType: widget.role,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) => _handelState(state),
      builder: (context, state) {
        if (state is SignupLoading) {
          return const Loading();
        }

        return Padding(
          padding: EdgeInsets.all(context.responsive.height20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                context.responsive.height20.verticalSpace,
                const CustomBackButton(),
                SizedBox(height: Dimensions.height30),
                CustomText(text: context.tr.createAccount),
                SizedBox(height: Dimensions.height45 * 1.3),
                ColumnOfTextFields(
                  context: context,
                  name: _name,
                  email: _email,
                  phone: _phone,
                  password: _password,
                  validator: (val) => _validation(context),
                ),
                SizedBox(height: Dimensions.height45),
                AppButton(
                  text: context.tr.signup,
                  isEnabled: context.watch<SignupCubit>().buttonEnabled,
                  onClick: () => _signup(context),
                ),
                SizedBox(height: Dimensions.height45),
                CustomTextButton(
                  text: context.tr.alreadyHaveAccount,
                  onClick: () {
                    context.navigator.push(LoginView.id);
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
