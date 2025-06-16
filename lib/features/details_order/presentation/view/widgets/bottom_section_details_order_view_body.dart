import 'package:flutter/material.dart';
import 'package:foodix/core/widgets/custom_item_details_order.dart';
import 'package:foodix/features/details_order/presentation/view/widgets/custom_item_list_view_details_order_section.dart';
import 'package:foodix/generated/l10n.dart';

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
                  startText: S.of(context).total,
                  endText: "280",
                ),
                CustomItemDetailsOrder(
                  startText: S.of(context).delivery,
                  endText: "20",
                ),
                CustomItemDetailsOrder(
                  startText: S.of(context).orderTotal,
                  endText: "300",
                ),
                CustomItemDetailsOrder(
                  startText: S.of(context).payment,
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
