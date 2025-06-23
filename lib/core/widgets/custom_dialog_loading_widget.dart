import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class CustomDialogLoadingWidget extends StatelessWidget {
  const CustomDialogLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: Dimensions.height130 * 0.9,
          height: Dimensions.height130 * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
              strokeWidth: 3,
            ),
          ),
        ),
      ),
    );
  }
}
