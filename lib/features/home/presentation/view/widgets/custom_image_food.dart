import 'package:flutter/material.dart';
import 'package:foodix/core/utils/app_assets.dart';
import 'package:foodix/core/widgets/custom_cashed_network_image.dart';

class CustomImageFood extends StatelessWidget {
  final String imageUrl;

  const CustomImageFood({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Dimensions.height130 * 1.2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(context.responsive.radius20),
        child: CustomCashedNetworkImage(
          imageURL: imageUrl,
          placeholder: AppAssets.food,
        ),
      ),
    );
  }
}
