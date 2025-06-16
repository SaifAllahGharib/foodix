import 'package:flutter/material.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onClick;
  final bool isEnabled;
  final String? fontFamily;

  const CustomButton({
    super.key,
    required this.text,
    required this.onClick,
    this.isEnabled = false,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isEnabled ? onClick : () {},
      height: Dimensions.height45,
      elevation: 0,
      enableFeedback: isEnabled ? true : false,
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.width120,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Dimensions.radius10,
        ),
      ),
      textColor: Colors.white,
      color: isEnabled ? AppColors.primaryColor : AppColors.disabledColor,
      child: Text(
        text,
        style: TextStyle(
          fontSize: Dimensions.fontSize15,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}
