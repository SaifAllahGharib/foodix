import 'package:flutter/material.dart';
import 'package:foodix/core/utils/app_assets.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_details_order_text.dart';
import 'package:foodix/core/widgets/custom_image.dart';

import '../shared/functions/current_locale_is_arabic.dart';

class CustomDetailsOrderNameImage extends StatelessWidget {
  final bool customTextDetails;

  const CustomDetailsOrderNameImage({
    super.key,
    this.customTextDetails = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(context.responsive.radius20),
          child: CustomImage(
            image: AppAssets.food,
            width: context.responsive.height96,
          ),
        ),
        context.responsive.width20.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Saif gharib",
              style: context.textStyle.s30W600,
              textAlign: currentLocaleIsArabic
                  ? TextAlign.right
                  : TextAlign.left,
            ),
            customTextDetails
                ? context.responsive.height2.verticalSpace
                : const SizedBox.shrink(),
            customTextDetails
                ? CustomDetailsOrderText(text: context.tr.completed)
                : const SizedBox.shrink(),
            context.responsive.height2.verticalSpace,
            Row(
              children: [
                CustomDetailsOrderText(
                  text: context.tr.orderNumber,
                  color: Colors.grey,
                ),
                const CustomDetailsOrderText(
                  text: "12345678911",
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
