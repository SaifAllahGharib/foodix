import 'package:flutter/material.dart';

import '../utils/assets.dart';
import '../utils/dimensions.dart';
import '../utils/styles.dart';

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
          Expanded(child: Image.asset(Assets.error)),
          SizedBox(height: Dimensions.height10),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: Styles.textStyle16(context),
          ),
        ],
      ),
    );
  }
}
