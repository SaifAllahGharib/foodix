import 'package:flutter/material.dart';
import 'package:foodix/core/utils/app_assets.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(AppAssets.empty));
  }
}
