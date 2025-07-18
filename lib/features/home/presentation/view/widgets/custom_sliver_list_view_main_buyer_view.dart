import 'package:flutter/material.dart';
import 'package:foodix/core/routing/app_route_name.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_item_sliver_list_view_buyer_view.dart';
import 'package:foodix/features/my_restaurant/data/models/restaurant_model.dart';

class CustomSliverListViewMainBuyerView extends StatelessWidget {
  final List<RestaurantModel> list;

  const CustomSliverListViewMainBuyerView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return CustomItemSliverListViewBuyerView(
          restaurant: list[index],
          onClick: () => context.navigator.pushNamed(AppRouteName.restaurant),
        );
      },
    );
  }
}
