import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_item_details_order.dart';
import 'package:foodix/features/details_order/presentation/view/widgets/custom_item_list_view_details_order_section.dart';

class BottomSectionDetailsOrderViewBody extends StatelessWidget {
  const BottomSectionDetailsOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return const CustomItemListViewDetailsOrderSection();
            },
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomItemDetailsOrder(
                  startText: context.translate.total,
                  endText: "280",
                ),
                CustomItemDetailsOrder(
                  startText: context.translate.delivery,
                  endText: "20",
                ),
                CustomItemDetailsOrder(
                  startText: context.translate.orderTotal,
                  endText: "300",
                ),
                CustomItemDetailsOrder(
                  startText: context.translate.payment,
                  endText: "cash",
                  cashEnabled: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
