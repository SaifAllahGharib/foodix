import 'package:flutter/material.dart';
import 'package:foodix/core/shared/models/food_model.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/features/food_details/presentation/view/widgets/details_food_view_body.dart';

class DetailsFoodView extends StatelessWidget {
  static const String id = "/food_details_view";

  const DetailsFoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsFoodViewBody(food: context.goRouterState.extra as FoodModel),
    );
  }
}
