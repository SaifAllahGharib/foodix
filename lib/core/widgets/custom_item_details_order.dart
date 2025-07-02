import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

class CustomItemDetailsOrder extends StatelessWidget {
  final String startText;
  final String endText;
  final bool cashEnabled;

  const CustomItemDetailsOrder({
    super.key,
    required this.startText,
    required this.endText,
    this.cashEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.responsive.height10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(startText, style: context.textStyle.s15W400),
          Row(
            children: [
              Text(endText, style: context.textStyle.s15W400),
              cashEnabled
                  ? context.responsive.width10.horizontalSpace
                  : const SizedBox.shrink(),
              cashEnabled
                  ? Text(context.tr.foodCost, style: context.textStyle.s15W400)
                  : const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
