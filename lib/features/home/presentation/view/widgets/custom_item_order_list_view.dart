import 'package:flutter/material.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/features/home/presentation/view/widgets/bottom_section_custom_item_order_list_view.dart';
import 'package:foodix/features/home/presentation/view/widgets/top_section_custom_item_order_list_view.dart';

class CustomItemOrderListView extends StatelessWidget {
  const CustomItemOrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.height10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        border: Border.all(
          color: AppColors.gray,
          width: 1,
        ),
      ),
      child: const Column(
        children: [
          TopSectionCustomItemOrderListView(),
          Divider(color: AppColors.gray, height: 1),
          BottomSectionCustomItemOrderListView(),
        ],
      ),
    );
  }
}
