import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../utils/app_assets.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;

  const CustomErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(AppAssets.error)),
          context.responsive.height10.verticalSpace,
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: context.textStyle.s16W500,
          ),
        ],
      ),
    );
  }
}
