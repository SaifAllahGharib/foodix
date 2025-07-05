import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_item_dates_orders_list_view.dart';

class DatesOrdersListView extends StatelessWidget {
  final List<String> list;
  final int selectedIndex;

  const DatesOrdersListView({
    super.key,
    required this.list,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.responsive.height80 * 0.6,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomItemDatesOrdersListView(
            index: index,
            selectedIndex: selectedIndex,
            list: list,
          );
        },
      ),
    );
  }
}
