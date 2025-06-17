import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';

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
    return AnimatedOpacity(
      opacity: isEnabled ? 1 : 0.6,
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: isEnabled
            ? () {
                HapticFeedback.lightImpact();
                onClick();
              }
            : null,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: Dimensions.height15 * 0.9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius10),
            gradient: isEnabled
                ? LinearGradient(
                    colors: [
                      AppColors.primaryColor,
                      AppColors.primaryColor.withOpacity(0.8),
                    ],
                  )
                : LinearGradient(
                    colors: [
                      AppColors.disabledColor,
                      AppColors.disabledColor.withOpacity(0.8),
                    ],
                  ),
            boxShadow: isEnabled
                ? [
                    BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.4),
                      offset: const Offset(0, 4),
                      blurRadius: 10,
                    ),
                  ]
                : [],
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: Styles.textStyle15(context).copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
