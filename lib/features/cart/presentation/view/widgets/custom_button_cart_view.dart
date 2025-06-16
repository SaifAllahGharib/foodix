import 'package:flutter/material.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';

class CustomButtonCartView extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onClick;
  final bool enableBorder;

  const CustomButtonCartView({
    super.key,
    required this.text,
    required this.onClick,
    this.color = AppColors.primaryColor,
    this.textColor = Colors.white,
    this.enableBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: onClick,
        enableFeedback: false,
        color: color,
        textColor: textColor,
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.height15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius20 * 5),
          side: enableBorder
              ? const BorderSide(
                  color: Colors.black54,
                  width: 1,
                )
              : BorderSide.none,
        ),
        child: Text(
          text,
          style: Styles.textStyle15(context),
        ),
      ),
    );
  }
}
