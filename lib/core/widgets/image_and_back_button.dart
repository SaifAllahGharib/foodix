import 'package:flutter/material.dart';
import 'package:foodix/core/utils/assets.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/widgets/custom_back_button.dart';
import 'package:foodix/core/widgets/custom_image.dart';

class ImageAndBackButton extends StatelessWidget {
  const ImageAndBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImage(
          image: Assets.food,
          width: double.infinity,
          height: Dimensions.height130 * 2.4,
        ),
        Padding(
          padding: EdgeInsets.all(Dimensions.height20),
          child: const CustomBackButton(),
        ),
      ],
    );
  }
}
