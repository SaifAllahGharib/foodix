import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/shared/viewmodel/cubits/show_password_cubit.dart';
import 'package:foodix/core/utils/extensions.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final void Function(String val)? onChanged;
  final bool isPassword;
  final TextInputType textInputType;
  final bool enabled;
  final TextStyle? hintStyle;

  const AppTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.onChanged,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.enabled = true,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.textStyle.s15W600),
        context.responsive.height10.verticalSpace,
        SizedBox(
          height: context.responsive.height47,
          child: BlocSelector<ShowPasswordCubit, bool, bool>(
            selector: (state) => state,
            builder: (context, state) {
              return TextFormField(
                enabled: enabled,
                controller: controller,
                onChanged: onChanged,
                obscureText: isPassword ? state : false,
                keyboardType: textInputType,
                style: context.textStyle.s15W500,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: hintStyle,
                  suffixIcon: isPassword
                      ? IconButton(
                          icon: Icon(
                            state
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                          onPressed: () =>
                              context.read<ShowPasswordCubit>().toggle(),
                        )
                      : null,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
