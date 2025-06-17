import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/viewmodel/cubits/local_cubit.dart';
import 'package:foodix/core/widgets/custom_text.dart';

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
            SizedBox(width: Dimensions.width30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: context.translate.address,
                  textSize: Dimensions.fontSize20 * 1.1,
                  alignment: context.watch<LocalCubit>().isArabic
                      ? Alignment.topRight
                      : Alignment.topLeft,
                ),
                SizedBox(height: Dimensions.height10 * 0.5),
                Text(
                  "Saif gharib",
                  style: Styles.textStyle15(
                    context,
                  ).copyWith(fontWeight: FontWeight.w400, color: Colors.black),
                ),
                SizedBox(height: Dimensions.height10 * 0.3),
                Text(
                  "Helwan elbalad3",
                  style: Styles.textStyle15(
                    context,
                  ).copyWith(fontWeight: FontWeight.w400, color: Colors.black),
                ),
                SizedBox(height: Dimensions.height10 * 0.3),
                Text(
                  "النصر عماره الحج نبوي بجوار بوابه الجيش",
                  style: Styles.textStyle15(
                    context,
                  ).copyWith(fontWeight: FontWeight.w400, color: Colors.black),
                ),
                SizedBox(height: Dimensions.height10 * 0.3),
                Row(
                  children: [
                    Text(
                      context.translate.phoneNumber,
                      style: Styles.textStyle15(context).copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: Dimensions.width10),
                    Text(
                      "+201014890911",
                      style: Styles.textStyle15(context).copyWith(
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
