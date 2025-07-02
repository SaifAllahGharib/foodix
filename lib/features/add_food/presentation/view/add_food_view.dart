import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/di/dependency_injection.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/features/add_food/presentation/view/widgets/add_food_view_body.dart';
import 'package:foodix/features/add_food/presentation/viewmodel/cubits/add_food/add_food_cubit.dart';

class AddFoodView extends StatelessWidget {
  const AddFoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddFoodCubit>(),
      child: Scaffold(
        body: AddFoodViewBody(categoryId: context.arguments as String),
      ),
    );
  }
}
