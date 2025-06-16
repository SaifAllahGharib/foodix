import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/widgets/custom_text_field.dart';
import 'package:foodix/features/signup/presentation/viewmodel/cubits/signup/signup_cubit.dart';
import 'package:foodix/generated/l10n.dart';

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
        CustomTextField(
          controller: widget.name,
          hint: S.of(context).hintName,
          onChanged: widget.validator,
        ),
        SizedBox(height: Dimensions.height15),
        CustomTextField(
          controller: widget.email,
          hint: S.of(context).hintEmail,
          onChanged: widget.validator,
        ),
        SizedBox(height: Dimensions.height15),
        CustomTextField(
          controller: widget.phone,
          hint: S.of(context).hintPhone,
          onChanged: widget.validator,
        ),
        SizedBox(height: Dimensions.height15),
        CustomTextField(
          controller: widget.password,
          isPassword: true,
          hint: S.of(context).hintPass,
          onPressedShowPassword:
              widget.context.read<SignupCubit>().togglePasswordVisibility,
          showPassword: widget.context.watch<SignupCubit>().showPassword,
          onChanged: widget.validator,
        ),
      ],
    );
  }
}
