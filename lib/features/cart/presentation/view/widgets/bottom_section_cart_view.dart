import 'package:flutter/material.dart';
import 'package:foodix/core/routing/app_route_name.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/features/cart/presentation/view/widgets/custom_button_cart_view.dart';

class BottomSectionCartView extends StatelessWidget {
  const BottomSectionCartView({super.key});

  void _goToRestaurantView(BuildContext context) {
    context.navigator.pushReplacementNamed(AppRouteName.restaurant);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.responsive.padding20,
        vertical: context.responsive.padding15,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.gray)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppButtonCartView(text: "Get Order", onClick: () {}),
          context.responsive.width75.horizontalSpace,
          AppButtonCartView(
            text: "Add Products",
            textColor: Colors.black,
            color: Colors.white,
            enableBorder: true,
            onClick: () => _goToRestaurantView(context),
          ),
        ],
      ),
    );
  }
}
