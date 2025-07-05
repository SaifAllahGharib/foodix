import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../../../../core/shared/models/food_model.dart';
import 'widgets/details_food_view_body.dart';

class DetailsFoodView extends StatelessWidget {
  const DetailsFoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsFoodViewBody(food: context.arguments as FoodModel),
    );
  }
}
