import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/di/dependency_injection.dart';
import 'package:foodix/core/utils/my_shared_preferences.dart';
import 'package:foodix/features/my_restaurant/presentation/view/widgets/my_restaurant_view_body.dart';
import 'package:foodix/features/my_restaurant/presentation/viewmodel/cubits/my_restaurant/my_restaurant_cubit.dart';

import '../../data/repos/my_restaurant_repo_imp.dart';

class MyRestaurantView extends StatelessWidget {
  static const String id = "/my_restaurant_view";

  const MyRestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyRestaurantCubit(
        getIt<MyRestaurantRepositoryImp>(),
        getIt<SharedPreferencesService>(),
      ),
      child: const Scaffold(body: MyRestaurantViewBody()),
    );
  }
}
