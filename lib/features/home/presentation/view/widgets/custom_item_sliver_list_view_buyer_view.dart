import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_cost_delivery.dart';
import 'package:foodix/core/widgets/custom_delivery_time_widget.dart';
import 'package:foodix/core/widgets/custom_dot_widget.dart';
import 'package:foodix/core/widgets/custom_rating_widget.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_image_item_sliver_list_view_buyer_view.dart';

import '../../../../my_restaurant/data/models/restaurant_model.dart';

class CustomItemSliverListViewBuyerView extends StatelessWidget {
  final void Function() onClick;
  final RestaurantModel restaurant;

  const CustomItemSliverListViewBuyerView({
    super.key,
    required this.onClick,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      enableFeedback: false,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.only(bottom: context.responsive.height10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.responsive.radius20),
          color: AppColors.whiteGray,
        ),
        child: Row(
          children: [
            const CustomImageItemSliverListViewBuyerView(),
            SizedBox(width: context.responsive.height15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bazoka", style: context.textStyle.s18W600),
                SizedBox(height: context.responsive.height15),
                const CustomRatingWidget(rating: 4.8, ratingCount: 265),
                SizedBox(height: context.responsive.height10 * 0.6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomDeliveryTimeWidget(time: 24),
                    context.responsive.width5.horizontalSpace,
                    const CustomDotWidget(),
                    context.responsive.width5.horizontalSpace,
                    const CustomCostDelivery(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
