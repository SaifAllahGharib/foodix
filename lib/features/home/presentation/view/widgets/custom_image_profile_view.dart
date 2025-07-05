import 'package:flutter/material.dart';
import 'package:foodix/core/utils/app_assets.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_cashed_network_image.dart';
import 'package:foodix/core/widgets/custom_item_pick_image.dart';

class CustomImageProfileView extends StatelessWidget {
  final void Function() pickImageFromCamera;
  final void Function() pickImageFromGallery;
  final String? imageURL;

  const CustomImageProfileView({
    super.key,
    required this.pickImageFromCamera,
    required this.pickImageFromGallery,
    required this.imageURL,
  });

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CustomItemPickImage(
          pickImageFromCamera: pickImageFromCamera,
          pickImageFromGallery: pickImageFromGallery,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(context.responsive.radius20 * 20),
        child: GestureDetector(
          onTap: () => _showBottomSheet(context),
          child: CustomCashedNetworkImage(
            imageURL: imageURL,
            placeholder: AppAssets.placeholder,
            width: context.responsive.height130 * 1.2,
            height: context.responsive.height130 * 1.2,
          ),
        ),
      ),
    );
  }
}
