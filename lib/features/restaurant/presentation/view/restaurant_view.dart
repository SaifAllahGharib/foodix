import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/features/restaurant/presentation/view/widgets/restaurant_view_body.dart';
import 'package:foodix/features/restaurant/viewmodel/cubits/restaurant/restaurant_cubit.dart';

class RestaurantView extends StatelessWidget {
  const RestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantCubit(),
      child: const Scaffold(body: RestaurantViewBody()),
    );
  }
}
