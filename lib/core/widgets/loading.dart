import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: LoadingAnimationWidget.stretchedDots(
          color: AppColors.primary,
          size: context.responsive.height80,
        ),
      ),
    );
  }
}
