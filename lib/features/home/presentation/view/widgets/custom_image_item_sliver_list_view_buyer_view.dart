import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/widgets/custom_cashed_network_image.dart';

class CustomImageItemSliverListViewBuyerView extends StatelessWidget {
  final String? imageUrl;

  const CustomImageItemSliverListViewBuyerView({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CustomCashedNetworkImage(
      imageURL: imageUrl,
      placeholder: AppAssets.placeholder,
      width: context.responsive.height96,
      height: context.responsive.height96,
    );
  }
}
