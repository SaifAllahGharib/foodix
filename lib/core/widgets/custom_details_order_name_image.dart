import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/assets.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/viewmodel/cubits/local_cubit.dart';
import 'package:foodix/core/widgets/custom_image.dart';
import 'package:foodix/core/widgets/custom_text.dart';
import 'package:foodix/features/details_order/presentation/view/widgets/custom_details_order_text.dart';
import 'package:foodix/generated/l10n.dart';

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
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          child: CustomImage(
            image: Assets.food,
            width: Dimensions.height80 * 1.2,
          ),
        ),
        SizedBox(width: Dimensions.width20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Saif gharib",
              textSize: Dimensions.fontSize20 * 0.94,
              alignment: context.watch<LocalCubit>().isArabic
                  ? Alignment.topRight
                  : Alignment.topLeft,
            ),
            customTextDetails
                ? SizedBox(height: Dimensions.height10 * 0.2)
                : const SizedBox.shrink(),
            customTextDetails
                ? CustomDetailsOrderText(text: S.of(context).completed)
                : const SizedBox.shrink(),
            SizedBox(height: Dimensions.height10 * 0.2),
            Row(
              children: [
                CustomDetailsOrderText(
                  text: S.of(context).orderNumber,
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
