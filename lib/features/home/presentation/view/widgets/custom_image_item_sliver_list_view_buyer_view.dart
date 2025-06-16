import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/viewmodel/cubits/local_cubit.dart';

class CustomImageItemSliverListViewBuyerView extends StatelessWidget {
  const CustomImageItemSliverListViewBuyerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.height130,
      height: Dimensions.height130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
              context.watch<LocalCubit>().isArabic ? 0 : Dimensions.radius20),
          bottomLeft: Radius.circular(
              context.watch<LocalCubit>().isArabic ? 0 : Dimensions.radius20),
          topRight: Radius.circular(
              context.watch<LocalCubit>().isArabic ? Dimensions.radius20 : 0),
          bottomRight: Radius.circular(
              context.watch<LocalCubit>().isArabic ? Dimensions.radius20 : 0),
        ),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(" "),
        ),
      ),
    );
  }
}
