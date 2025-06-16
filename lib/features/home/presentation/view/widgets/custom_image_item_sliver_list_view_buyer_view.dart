import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_cashed_network_image.dart';

class CustomImageItemSliverListViewBuyerView extends StatelessWidget {
  final String? imageUrl;

  const CustomImageItemSliverListViewBuyerView({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CustomCashedNetworkImage(
      imageURL: imageUrl,
      placeholder: Assets.placeholder,
      width: Dimensions.height80 * 1.2,
      height: Dimensions.height80 * 1.2,
    );
  }
}
