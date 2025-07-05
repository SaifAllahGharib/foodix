import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_cost_delivery.dart';
import 'package:foodix/core/widgets/custom_delivery_time_widget.dart';
import 'package:foodix/core/widgets/custom_dot_widget.dart';
import 'package:foodix/features/restaurant/presentation/view/widgets/image_and_name_and_rating_widget.dart';

class CustomBoxOfRestaurantDetails extends StatelessWidget {
  const CustomBoxOfRestaurantDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.responsive.height117,
      left: 0,
      right: 0,
      child: Container(
        height: context.responsive.height130 * 1.1,
        width: double.infinity,
        padding: EdgeInsets.only(
          top: context.responsive.height15,
          right: context.responsive.height15,
          left: context.responsive.height15,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: context.responsive.width30 * 1.2,
        ),
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
          borderRadius: BorderRadius.circular(context.responsive.radius20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImageAndNameAndRatingWidget(),
            SizedBox(height: context.responsive.height15),
            Row(
              children: [
                const CustomDeliveryTimeWidget(time: 24),
                SizedBox(width: context.responsive.width15),
                const CustomDotWidget(),
                SizedBox(width: context.responsive.width15),
                const CustomCostDelivery(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
