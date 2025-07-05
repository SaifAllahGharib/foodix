import 'package:flutter/material.dart';
import 'package:foodix/core/routing/app_route_name.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';

import 'custom_search_text_field.dart';

class CustomAppBarMainBuyerView extends StatefulWidget {
  const CustomAppBarMainBuyerView({super.key});

  @override
  State<CustomAppBarMainBuyerView> createState() =>
      _CustomAppBarMainBuyerViewState();
}

class _CustomAppBarMainBuyerViewState extends State<CustomAppBarMainBuyerView> {
  late final TextEditingController _search;

  @override
  void initState() {
    _search = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      height: context.responsive.height130 * 1.65,
      child: Padding(
        padding: EdgeInsets.only(
          top: context.responsive.height45,
          right: context.responsive.height20,
          left: context.responsive.height20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Delivery to Helwan",
                      style: context.textStyle.s15W400.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    context.responsive.width5.horizontalSpace,
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      context.responsive.height20 * 5,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      context.navigator.pushNamed(AppRouteName.cart);
                    },
                    enableFeedback: false,
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            context.responsive.height20.verticalSpace,
            CustomSearchTextField(controller: _search, onChange: (value) {}),
          ],
        ),
      ),
    );
  }
}
