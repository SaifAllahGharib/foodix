import 'package:flutter/material.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';
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
        margin: EdgeInsets.only(bottom: Dimensions.height10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          color: AppColors.whiteGray,
        ),
        child: Row(
          children: [
            const CustomImageItemSliverListViewBuyerView(),
            SizedBox(width: Dimensions.height15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bazoka", style: Styles.textStyle18(context)),
                SizedBox(height: Dimensions.height15),
                const CustomRatingWidget(rating: 4.8, ratingCount: 265),
                SizedBox(height: Dimensions.height10 * 0.6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomDeliveryTimeWidget(time: 24),
                    SizedBox(width: Dimensions.height10 * 0.5),
                    const CustomDotWidget(),
                    SizedBox(width: Dimensions.height10 * 0.5),
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
