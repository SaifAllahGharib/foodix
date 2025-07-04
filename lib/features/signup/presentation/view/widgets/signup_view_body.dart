import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/routing/app_route_name.dart';
import 'package:foodix/core/shared/page_state.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/app_button.dart';
import 'package:foodix/core/widgets/custom_text_button.dart';
import 'package:foodix/core/widgets/loading.dart';
import 'package:foodix/features/signup/data/models/signup_model.dart';
import 'package:foodix/features/signup/presentation/view/widgets/column_of_text_fields.dart';
import 'package:foodix/features/signup/presentation/viewmodel/cubits/signup/signup_cubit.dart';
import 'package:foodix/features/signup/presentation/viewmodel/cubits/signup/signup_state.dart';

import '../../../../../core/shared/functions/snack_bar.dart';
import '../../../../../core/widgets/custom_back_button.dart';

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
    context.navigator.pushNamed(
      AppRouteName.verification,
      arguments: _email.text,
    );
  }

  void _handleState(SignupState state) {
    final status = state.status;

    if (status is PageSuccess) {
      if (state.msg == context.tr.success) {
        _pushToVerificationView();
      }
    } else if (status is PageFailure) {
      final message = status.message;

      if (message == "wrong_password") {
        snackBar(context: context, text: context.tr.weakPassword);
      } else if (message == "email_in_use") {
        snackBar(context: context, text: context.tr.userAlreadyExists);
      } else {
        snackBar(context: context, text: message);
      }
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
                context.responsive.height20.verticalSpace,
                const CustomBackButton(),
                context.responsive.height30.verticalSpace,
                Text(
                  context.tr.createAccount,
                  style: context.textStyle.s30W600,
                ),
                context.responsive.height47.verticalSpace,
                ColumnOfTextFields(
                  context: context,
                  name: _name,
                  email: _email,
                  phone: _phone,
                  password: _password,
                  validator: (val) => _validation(context),
                ),
                context.responsive.height45.verticalSpace,
                AppButton(
                  text: context.tr.signup,
                  isEnabled: state.buttonEnabled,
                  onClick: () => _signup(context),
                ),
                context.responsive.height45.verticalSpace,
                CustomTextButton(
                  text: context.tr.alreadyHaveAccount,
                  onClick: () {
                    context.navigator.pushNamed(AppRouteName.login);
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
