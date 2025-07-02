import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/AppStyles.dart';
import 'package:foodix/core/utils/extensionom_text.dart';

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
                CustomText(
                  text: context.tr.address,
                  textSize: Dimensions.fontSize20 * 1.1,
                  alignment: currentLocaleIsArabic
                      ? Alignment.topRight
                      : Alignment.topLeft,
                ),
                context.responsive.height5.verticalSpace,
                Text(
                  "Saif gharib",
                  style: AppStyles.textStyle15(
                    context,
                  ).copyWith(fontWeight: FontWeight.w400, color: Colors.black),
                ),
                SizedBox(height: context.responsive.height3),
                Text(
                  "Helwan elbalad3",
                  style: AppStyles.textStyle15(
                    context,
                  ).copyWith(fontWeight: FontWeight.w400, color: Colors.black),
                ),
                SizedBox(height: context.responsive.height3),
                Text(
                  "النصر عماره الحج نبوي بجوار بوابه الجيش",
                  style: AppStyles.textStyle15(
                    context,
                  ).copyWith(fontWeight: FontWeight.w400, color: Colors.black),
                ),
                SizedBox(height: context.responsive.height3),
                Row(
                  children: [
                    Text(
                      context.tr.phoneNumber,
                      style: context.textStyle.s15W400.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: context.responsive.width10),
                    Text(
                      "+201014890911",
                      style: context.textStyle.s15W400.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
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
