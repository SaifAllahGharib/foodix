import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/styles.dart';

class CompleteRestaurantDialogWidget extends StatelessWidget {
  const CompleteRestaurantDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
      ),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.height20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.restaurant_menu_rounded,
              size: Dimensions.height45,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: Dimensions.height10),
            Text(
              context.translate.completeYourRestaurant,
              style: Styles.textStyle18(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Dimensions.height10),
            Text(
              context.translate.toProceedPlease,
              style: Styles.textStyle12(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Dimensions.height20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check_circle_outline, color: Colors.white),
                label: Text(
                  context.translate.gotIt,
                  style: Styles.textStyle12(
                    context,
                  ).copyWith(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
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
