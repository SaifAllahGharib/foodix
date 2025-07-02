import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_back_button.dart';

class CustomAppBarCartView extends StatelessWidget {
  const CustomAppBarCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: context.responsive.padding10,
        top: context.responsive.padding20,
        left: context.responsive.padding10,
        bottom: context.responsive.padding10,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: AppColors.gray)),
      ),
      child: Row(
        children: [
          const CustomBackButton(),
          context.responsive.width75.horizontalSpace,
          Column(
            children: [
              Text("cart", style: context.textStyle.s18W600),
              context.responsive.height5.verticalSpace,
              Text("Bazoka", style: context.textStyle.s12W400),
            ],
          ),
        ],
      ),
    );
  }
}
