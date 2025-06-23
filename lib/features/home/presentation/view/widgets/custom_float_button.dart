import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';

import '../../../../../core/shared/viewmodel/cubits/local_cubit.dart';

class CustomFloatButton extends StatelessWidget {
  final void Function() onClick;

  const CustomFloatButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: context.watch<LocalCubit>().isArabic
          ? Alignment.bottomLeft
          : Alignment.bottomRight,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(5000),
        ),
        padding: EdgeInsets.all(Dimensions.width10),
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
