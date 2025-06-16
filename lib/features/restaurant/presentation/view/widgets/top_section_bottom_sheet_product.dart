import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/widgets/image_and_back_button.dart';

class TopSectionBottomSheetProduct extends StatelessWidget {
  const TopSectionBottomSheetProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ImageAndBackButton(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.height15,
            vertical: Dimensions.height20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "foodName",
                style: Styles.textStyle18(context),
              ),
              SizedBox(height: Dimensions.height15),
              Text(
                "foodDesc",
                style: Styles.textStyle15(context).copyWith(color: Colors.grey),
              ),
            ],
          ),
        )
      ],
    );
  }
}
