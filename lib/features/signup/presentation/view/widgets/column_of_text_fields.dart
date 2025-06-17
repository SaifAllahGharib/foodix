import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_text_form_field.dart';
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
        CustomTextFormField(
          controller: widget.name,
          label: context.translate.labelName,
          hint: context.translate.hintName,
          onChanged: widget.validator,
        ),
        SizedBox(height: Dimensions.height15),
        CustomTextFormField(
          controller: widget.email,
          label: context.translate.labelEmail,
          hint: context.translate.hintEmail,
          onChanged: widget.validator,
        ),
        SizedBox(height: Dimensions.height15),
        CustomTextFormField(
          controller: widget.phone,
          label: context.translate.labelPhone,
          hint: context.translate.hintPhone,
          onChanged: widget.validator,
        ),
        SizedBox(height: Dimensions.height15),
        CustomTextFormField(
          controller: widget.password,
          label: context.translate.labelPass,
          isPassword: true,
          hint: context.translate.hintPass,
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
