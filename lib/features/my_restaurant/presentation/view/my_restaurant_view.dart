import 'package:flutter/material.dart';
import 'package:foodix/features/my_restaurant/presentation/view/widgets/my_restaurant_view_body.dart';

class MyRestaurantView extends StatelessWidget {
  static const String id = "/my_restaurant_view";

  const MyRestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyRestaurantViewBody());
  }
}
