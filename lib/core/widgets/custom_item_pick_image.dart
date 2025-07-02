import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

class CustomItemPickImage extends StatelessWidget {
  final void Function() pickImageFromCamera;
  final void Function() pickImageFromGallery;

  const CustomItemPickImage({
    super.key,
    required this.pickImageFromCamera,
    required this.pickImageFromGallery,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.responsive.padding20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: pickImageFromCamera,
          ),
          SizedBox(width: context.responsive.width10),
          IconButton(
            icon: const Icon(Icons.image_outlined),
            onPressed: pickImageFromGallery,
          ),
        ],
      ),
    );
  }
}
