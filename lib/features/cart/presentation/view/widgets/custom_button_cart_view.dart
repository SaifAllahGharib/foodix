import 'package:flutter/material.dart';  
import 'package:foodix/core/styles/app_colors.dart';  
import 'package:foodix/core/utils/extensions.dart';  

class AppButtonCartView extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onClick;
  final bool enableBorder;

  const AppButtonCartView({
    super.key,
    required this.text,
    required this.onClick,
    this.color = AppColors.primary,
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
        padding: EdgeInsets.symmetric(vertical: context.responsive.padding15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.responsive.radius100),
          side: enableBorder
              ? const BorderSide(color: Colors.black54)
              : BorderSide.none,
        ),
        child: Text(text, style: context.textStyle.s15W400),
      ),
    );
  }
}
