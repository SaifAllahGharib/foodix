import 'package:flutter/material.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/widgets/custom_cost_delivery.dart';
import 'package:foodix/core/widgets/custom_delivery_time_widget.dart';
import 'package:foodix/core/widgets/custom_dot_widget.dart';
import 'package:foodix/features/restaurant/presentation/view/widgets/image_and_name_and_rating_widget.dart';

class CustomBoxOfRestaurantDetails extends StatelessWidget {
  const CustomBoxOfRestaurantDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Dimensions.height130 * 0.92,
      left: 0,
      right: 0,
      child: Container(
        height: Dimensions.height130 * 1.1,
        width: double.infinity,
        padding: EdgeInsets.only(
          top: Dimensions.height15,
          right: Dimensions.height15,
          left: Dimensions.height15,
        ),
        margin: EdgeInsets.symmetric(horizontal: Dimensions.width30 * 1.2),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: AppColors.gray,
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(Dimensions.radius20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImageAndNameAndRatingWidget(),
            SizedBox(height: Dimensions.height15),
            Row(
              children: [
                const CustomDeliveryTimeWidget(time: 24),
                SizedBox(width: Dimensions.width15),
                const CustomDotWidget(),
                SizedBox(width: Dimensions.width15),
                const CustomCostDelivery(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
