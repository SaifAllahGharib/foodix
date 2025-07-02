import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/features/cart/presentation/view/widgets/custom_item_list_view_cart_view.dart';

class CustomListViewCartView extends StatelessWidget {
  const CustomListViewCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(context.responsive.padding15),
        child: ListView.builder(
          itemCount: 5,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return CustomItemListViewCartView(index: index);
          },
        ),
      ),
    );
  }
}
