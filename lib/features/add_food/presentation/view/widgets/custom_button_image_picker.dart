import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_item_pick_image.dart';

class AppButtonImagePicker extends StatelessWidget {
  final void Function() pickImageFromCamera;
  final void Function() pickImageFromGallery;
  final String? selectedImage;

  const AppButtonImagePicker({
    super.key,
    required this.pickImageFromCamera,
    required this.pickImageFromGallery,
    required this.selectedImage,
  });

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return CustomItemPickImage(
          pickImageFromCamera: pickImageFromCamera,
          pickImageFromGallery: pickImageFromGallery,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showBottomSheet(context),
      borderRadius: BorderRadius.circular(context.responsive.radius20),
      child: selectedImage == null
          ? Container(
              width: double.infinity,
              height: context.responsive.height130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  context.responsive.radius20,
                ),
                border: Border.all(width: 1, color: AppColors.gray),
              ),
              child: Icon(
                Icons.add,
                size: context.responsive.height45,
                color: AppColors.gray,
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(context.responsive.radius20),
              child: Image.file(
                File(selectedImage!),
                width: context.responsive.height221,
                height: context.responsive.height221,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
