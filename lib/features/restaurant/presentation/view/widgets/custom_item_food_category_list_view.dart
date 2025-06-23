import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/widgets/custom_food_image.dart';
import 'package:foodix/core/widgets/custom_row_cost.dart';

import '../../../../../core/shared/viewmodel/cubits/local_cubit.dart';

class CustomItemFoodCategoryListView extends StatelessWidget {
  final int index;
  final String foodName;
  final String foodDesc;
  final double foodPrice;
  final String foodImage;
  final List listOfFood;
  final void Function() onClickInItem;

  const CustomItemFoodCategoryListView({
    super.key,
    required this.index,
    required this.foodName,
    required this.foodDesc,
    required this.foodPrice,
    required this.foodImage,
    required this.listOfFood,
    required this.onClickInItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClickInItem,
      enableFeedback: false,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: Dimensions.height130,
            padding: EdgeInsets.only(
              bottom: Dimensions.height15,
              right: context.watch<LocalCubit>().isArabic
                  ? 0
                  : Dimensions.height20,
              left: context.watch<LocalCubit>().isArabic
                  ? Dimensions.height20
                  : 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFoodImage(
                  image: foodImage,
                  width: Dimensions.height130 * 0.9,
                  height: Dimensions.height130 * 0.9,
                ),
                SizedBox(width: Dimensions.width30 * 2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          foodName,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle16(context),
                        ),
                      ),
                      SizedBox(height: Dimensions.height10),
                      Expanded(
                        child: Text(
                          foodDesc,
                          softWrap: true,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle12(context),
                        ),
                      ),
                      const Spacer(),
                      CustomRowCost(
                        egp: foodPrice,
                        fontWeight: FontWeight.w600,
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (index != listOfFood.length - 1)
            const Divider(height: 1, color: AppColors.gray),
          if (index != listOfFood.length - 1)
            SizedBox(height: Dimensions.height20),
        ],
      ),
    );
  }
}
