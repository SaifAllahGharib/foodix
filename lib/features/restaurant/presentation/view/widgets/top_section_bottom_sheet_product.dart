import 'package:flutter/material.dart';
import 'package:foodix/core/widgets/image_and_back_button.dart';

class TopSectionBottomSheetProduct extends StatelessWidget {
  const TopSectionBottomSheetProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageAndBackButton(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.responsive.height15,
            vertical: context.responsive.height20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("foodName", style: context.textStyle.s18W600),
              SizedBox(height: context.responsive.height15),
              Text(
                "foodDesc",
                style: AppStyles.textStyle15(
                  context,
                ).copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
