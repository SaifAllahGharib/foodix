import 'package:flutter/material.dart';

import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/widgets/custom_back_button.dart';

class CustomAppBarCartView extends StatelessWidget {
  const CustomAppBarCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: Dimensions.height10,
        top: Dimensions.height20,
        left: Dimensions.height10,
        bottom: Dimensions.height10,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.gray,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          const CustomBackButton(),
          SizedBox(width: Dimensions.width30 * 1.5),
          Column(
            children: [
              Text(
                "cart",
                style: Styles.textStyle18(context),
              ),
              SizedBox(height: Dimensions.height10 * 0.5),
              Text(
                "Bazoka",
                style: Styles.textStyle12(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
