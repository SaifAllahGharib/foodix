import 'package:flutter/material.dart';  
import 'package:foodix/core/styles/app_colors.dart';  
import 'package:foodix/core/utils/extensions.dart';  
import 'package:foodix/core/widgets/custom_food_image.dart';  
import 'package:foodix/core/widgets/custom_row_cost.dart';  

import '../../../../../core/shared/functions/current_locale_is_arabic.dart';  

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
            height: context.responsive.height130,
            padding: EdgeInsets.only(
              bottom: context.responsive.padding15,
              right: currentLocaleIsArabic ? 0 : context.responsive.padding20,
              left: currentLocaleIsArabic ? context.responsive.padding20 : 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFoodImage(
                  image: foodImage,
                  width: context.responsive.height117,
                  height: context.responsive.height117,
                ),
                SizedBox(width: context.responsive.width30 * 2),
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
                          style: context.textStyle.s16W500,
                        ),
                      ),
                      context.responsive.height10.verticalSpace,
                      Expanded(
                        child: Text(
                          foodDesc,
                          softWrap: true,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyle.s12W400,
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
            context.responsive.height20.verticalSpace,
        ],
      ),
    );
  }
}
