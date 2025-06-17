import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/viewmodel/cubits/local_cubit.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  final Color color;

  const CustomBackButton({super.key, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: context.watch<LocalCubit>().isArabic
          ? Alignment.topRight
          : Alignment.topLeft,
      child: Container(
        width: Dimensions.height45 * 0.9,
        height: Dimensions.height45 * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5000),
          border: Border.all(color: AppColors.gray, width: 1),
        ),
        child: IconButton(
          onPressed: context.pop,
          enableFeedback: false,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: Icon(
            Icons.arrow_back,
            size: Dimensions.iconSize20,
            color: color,
          ),
        ),
      ),
    );
  }
}
