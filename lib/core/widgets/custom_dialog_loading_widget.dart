import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../styles/app_colors.dart';

class CustomDialogLoadingWidget extends StatelessWidget {
  const CustomDialogLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: context.responsive.height117,
          height: context.responsive.height117,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(context.responsive.radius15),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: 3,
            ),
          ),
        ),
      ),
    );
  }
}
