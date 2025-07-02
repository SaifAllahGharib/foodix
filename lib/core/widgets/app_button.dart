import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function() onClick;
  final bool isEnabled;
  final String? fontFamily;

  const AppButton({
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
                HapticFeedback.vibrate();
                onClick();
              }
            : null,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: context.responsive.padding14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.responsive.radius10),
            gradient: isEnabled
                ? LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.primary.withOpacity(0.8),
                    ],
                  )
                : LinearGradient(
                    colors: [
                      AppColors.secondary,
                      AppColors.secondary.withOpacity(0.8),
                    ],
                  ),
            boxShadow: isEnabled
                ? [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.4),
                      offset: const Offset(0, 4),
                      blurRadius: 10,
                    ),
                  ]
                : [],
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: context.textStyle.s15W600.copyWith(
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
