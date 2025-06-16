import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/viewmodel/cubits/local_cubit.dart';
import 'package:foodix/core/widgets/custom_row_cost.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_image_food.dart';

import '../../../../../core/shared/models/ProductModel.dart';

class GridItemView extends StatelessWidget {
  final ProductModel productModel;
  final int index;
  final void Function() onClick;

  const GridItemView({
    super.key,
    required this.productModel,
    required this.index,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomImageFood(
              imageUrl: productModel.foods![index].foodImage ?? "",
            ),
            SizedBox(height: Dimensions.height10),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.height10 * 0.5,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: context.watch<LocalCubit>().isArabic
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Text(
                      productModel.foods![index].foodName,
                      style: Styles.textStyle18(context),
                    ),
                  ),
                  SizedBox(height: Dimensions.height10 * 0.7),
                  Align(
                    alignment: context.watch<LocalCubit>().isArabic
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: CustomRowCost(
                      egp: productModel.foods![index].foodPrice,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
