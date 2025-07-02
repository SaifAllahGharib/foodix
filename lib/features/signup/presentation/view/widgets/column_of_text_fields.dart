import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/features/signup/presentation/viewmodel/cubits/signup/signup_cubit.dart';

class ColumnOfTextFields extends StatefulWidget {
  final BuildContext context;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController password;
  final void Function(String? val) validator;

  const ColumnOfTextFields({
    super.key,
    required this.context,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.validator,
  });

  @override
  State<ColumnOfTextFields> createState() => _ColumnOfTextFieldsState();
}

class _ColumnOfTextFieldsState extends State<ColumnOfTextFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          controller: widget.name,
          label: context.tr.labelName,
          hint: context.tr.hintName,
          onChanged: widget.validator,
        ),
        SizedBox(height: context.responsive.height15),
        AppTextFormField(
          controller: widget.email,
          label: context.tr.labelEmail,
          hint: context.tr.hintEmail,
          onChanged: widget.validator,
        ),
        SizedBox(height: context.responsive.height15),
        AppTextFormField(
          controller: widget.phone,
          label: context.tr.labelPhone,
          hint: context.tr.hintPhone,
          onChanged: widget.validator,
        ),
        SizedBox(height: context.responsive.height15),
        AppTextFormField(
          controller: widget.password,
          label: context.tr.labelPass,
          isPassword: true,
          hint: context.tr.hintPass,
          onPressedShowPassword: widget.context
              .read<SignupCubit>()
              .togglePasswordVisibility,
          showPassword: widget.context.watch<SignupCubit>().showPassword,
          onChanged: widget.validator,
        ),
      ],
    );
  }
}
