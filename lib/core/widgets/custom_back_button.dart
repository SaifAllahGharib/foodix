import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/viewmodel/cubits/local_cubit.dart';

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
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5000),
            border: Border.all(
              color: AppColors.gray,
              width: 1,
            )),
        child: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          enableFeedback: false,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: Icon(
            Icons.arrow_back,
            size: Dimensions.iconSize24,
            color: color,
          ),
        ),
      ),
    );
  }
}
