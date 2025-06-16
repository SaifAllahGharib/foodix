import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_app_bar_main_buyer_view.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_sliver_list_view_main_buyer_view.dart';

class MainBuyerView extends StatefulWidget {
  const MainBuyerView({super.key});

  @override
  State<MainBuyerView> createState() => _MainBuyerViewState();
}

class _MainBuyerViewState extends State<MainBuyerView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: CustomAppBarMainBuyerView()),
        SliverPadding(
          padding: EdgeInsets.all(Dimensions.height20),
          sliver: const CustomSliverListViewMainBuyerView(),
        ),
      ],
    );
  }
}
