import 'package:flutter/material.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/generated/l10n.dart';

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
        hintText: S.of(context).search,
        hintStyle: const TextStyle(
          color: Colors.black45,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius20 * 4),
          borderSide: BorderSide(
            width: isSeller ? 1 : 0,
            color: isSeller ? AppColors.gray : Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius20 * 2),
          borderSide: BorderSide(
            width: isSeller ? 1 : 0,
            color: isSeller ? AppColors.primaryColor : Colors.white,
          ),
        ),
      ),
      onChanged: onChange,
    );
  }
}
