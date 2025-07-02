import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String value) onChange;
  final bool isSeller;

  const CustomSearchTextField({
    super.key,
    required this.onChange,
    required this.controller,
    this.isSeller = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: context.tr.search,
        hintStyle: const TextStyle(color: Colors.black45),
        contentPadding: EdgeInsets.symmetric(
          horizontal: context.responsive.height20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.responsive.radius20 * 4),
          borderSide: BorderSide(
            width: isSeller ? 1 : 0,
            color: isSeller ? AppColors.gray : Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.responsive.radius20 * 2),
          borderSide: BorderSide(
            width: isSeller ? 1 : 0,
            color: isSeller ? AppColors.primary : Colors.white,
          ),
        ),
      ),
      onChanged: onChange,
    );
  }
}
