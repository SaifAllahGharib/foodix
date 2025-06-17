import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/di.dart';
import 'package:foodix/core/utils/image_picker_helper.dart';
import 'package:foodix/features/add_food/data/repos/add_food_repo_imp.dart';
import 'package:foodix/features/add_food/presentation/view/widgets/add_food_view_body.dart';
import 'package:foodix/features/add_food/presentation/viewmodel/cubits/add_food/add_food_cubit.dart';

class AddFoodView extends StatelessWidget {
  static const String id = "/add_food";
  final String categoryName;

  const AddFoodView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddFoodCubit(
        getIt.get<AddFoodRepositoryImp>(),
        getIt.get<ImagePickerHelper>(),
      ),
      child: Scaffold(body: AddFoodViewBody(categoryName: categoryName)),
    );
  }
}
