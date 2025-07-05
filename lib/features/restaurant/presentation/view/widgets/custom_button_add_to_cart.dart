import 'package:flutter/material.dart';  
import 'package:foodix/core/styles/app_colors.dart';  
import 'package:foodix/core/utils/extensions.dart';  
import 'package:foodix/core/widgets/custom_row_cost.dart';  

class AppButtonAddToCart extends StatelessWidget {
  final double price;

  const AppButtonAddToCart({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.responsive.padding20,
          vertical: context.responsive.padding15,
        ),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(context.responsive.radius20 * 5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "add_to_cart",
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: context.textStyle.s15W500.copyWith(color: Colors.white),
              ),
            ),
            context.responsive.width20.horizontalSpace,
            CustomRowCost(
              egp: price,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
