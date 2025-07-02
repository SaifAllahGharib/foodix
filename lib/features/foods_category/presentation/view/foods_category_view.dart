import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/features/foods_category/data/repos/foods_category_repo_imp.dart';
import 'package:foodix/features/foods_category/presentation/viewmodel/cubit/foods_category/foods_category_cubit.dart';

import '../../../../core/di/dependency_injection.dart';
import 'widgets/foods_category_view_body.dart';

class FoodsCategoryView extends StatelessWidget {
  static const String id = "/category_foods_view";

  const FoodsCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            FoodsCategoryCubit(getIt<FoodsCategoryRepositoryImp>()),
        child: FoodsCategoryViewBody(
          categoryId: context.goRouterState.extra as String,
        ),
      ),
    );
  }
}
