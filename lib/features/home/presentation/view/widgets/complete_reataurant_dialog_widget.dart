import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../../../../../core/styles/app_colors.dart';
t';

import '../../../../../core/utils/dimensionpStyles.dart';

class CompleteRestaurantDialogWidget extends StatelessWidget {
  const CompleteRestaurantDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.responsive.radius20),
      ),
      child: Padding(
        padding: EdgeInsets.all(context.responsive.height20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.restaurant_menu_rounded,
              size: Dimensions.height45,
              color: AppColors.primary,
            ),
            context.responsive.height10.verticalSpace,
            Text(
              context.tr.completeYourRestaurant,
              style: context.textStyle.s18W600,
              textAlign: TextAlign.center,
            ),
            context.responsive.height10.verticalSpace,
            Text(
              context.tr.toProceedPlease,
              style: AppStyles.textStyle12(context),
              textAlign: TextAlign.center,
            ),
            context.responsive.height20.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                ),
                label: Text(
                  context.tr.gotIt,
                  style: AppStyles.textStyle12(
                    context,
                  ).copyWith(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      context.responsive.radius10,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: context.responsive.height10,
                  ),
                ),
                onPressed: context.pop,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
