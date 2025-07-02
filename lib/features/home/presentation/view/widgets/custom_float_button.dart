import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/styles/app_colors.dart';

class CustomFloatButton extends StatelessWidget {
  final void Function() onClick;

  const CustomFloatButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: currentLocaleIsArabic
          ? Alignment.bottomLeft
          : Alignment.bottomRight,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(5000),
        ),
        padding: EdgeInsets.all(context.responsive.width10),
        child: IconButton(
          onPressed: onClick,
          enableFeedback: false,
          icon: Icon(
            Icons.add,
            size: Dimensions.screenWidth * 0.070,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
