import 'package:flutter/material.dart';
import 'package:foodix/core/shared/models/food_model.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/features/food_details/presentation/view/widgets/food_details_view_body.dart';

class FoodDetailsView extends StatelessWidget {
  static const String id = "/food_details_view";

  const FoodDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FoodDetailsViewBody(food: context.goRouterState.extra as FoodModel),
    );
  }
}
