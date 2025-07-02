import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_back_button.dart';
import 'package:foodix/core/widgets/custom_cashed_network_image.dart';

import '../shared/models/food_model.dart';
import '../utils/app_assets.dart';

class ImageAndBackButton extends StatelessWidget {
  final FoodModel? food;

  const ImageAndBackButton({super.key, this.food});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomCashedNetworkImage(
          imageURL: food?.foodImage,
          placeholder: AppAssets.food,
          width: double.infinity,
          height: context.responsive.height312,
        ),
        Padding(
          padding: EdgeInsets.all(context.responsive.padding20),
          child: const CustomBackButton(),
        ),
      ],
    );
  }
}
