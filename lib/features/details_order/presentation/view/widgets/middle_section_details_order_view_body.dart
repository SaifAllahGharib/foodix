import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

class MiddleSectionDetailsOrderViewBody extends StatelessWidget {
  const MiddleSectionDetailsOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.location_on_outlined),
            context.responsive.width30.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.tr.address, style: context.textStyle.s20WB),
                context.responsive.height5.verticalSpace,
                Text("Saif gharib", style: context.textStyle.s15W400),
                SizedBox(height: context.responsive.height3),
                Text("Helwan elbalad3", style: context.textStyle.s15W400),
                SizedBox(height: context.responsive.height3),
                Text(
                  "النصر عماره الحج نبوي بجوار بوابه الجيش",
                  style: context.textStyle.s15W400,
                ),
                SizedBox(height: context.responsive.height3),
                Row(
                  children: [
                    Text(
                      context.tr.phoneNumber,
                      style: context.textStyle.s15W400,
                    ),
                    SizedBox(width: context.responsive.width10),
                    Text("+201014890911", style: context.textStyle.s15W400),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
