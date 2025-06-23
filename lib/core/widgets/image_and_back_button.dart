import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/widgets/custom_back_button.dart';
import 'package:foodix/core/widgets/custom_cashed_network_image.dart';

import '../shared/models/food_model.dart';
import '../utils/assets.dart';

class ImageAndBackButton extends StatelessWidget {
  final FoodModel? food;

  const ImageAndBackButton({super.key, this.food});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomCashedNetworkImage(
          imageURL: food?.foodImage,
          placeholder: Assets.food,
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
