import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';

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
      padding: EdgeInsets.all(Dimensions.height20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: pickImageFromCamera,
          ),
          SizedBox(width: Dimensions.width10),
          IconButton(
            icon: const Icon(Icons.image_outlined),
            onPressed: pickImageFromGallery,
          ),
        ],
      ),
    );
  }
}
