import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/features/cart/presentation/view/cart_view.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_search_text_field.dart';

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
      color: AppColors.primaryColor,
      height: Dimensions.height130 * 1.65,
      child: Padding(
        padding: EdgeInsets.only(
          top: Dimensions.height45,
          right: Dimensions.height20,
          left: Dimensions.height20,
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
                      style: Styles.textStyle15(context).copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: Dimensions.height10 * 0.5),
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(Dimensions.height20 * 5),
                  ),
                  child: IconButton(
                    onPressed: () {
                      GoRouter.of(context).push(CartView.id);
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
            SizedBox(height: Dimensions.height20),
            CustomSearchTextField(
              controller: _search,
              onChange: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
