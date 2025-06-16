import 'package:flutter/material.dart';

import '../../../../core/shared/models/category_model.dart';
import 'widgets/category_foods_view_body.dart';

class CategoryFoodsView extends StatelessWidget {
  static const String id = "/category_foods_view";

  final CategoryModel category;

  const CategoryFoodsView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CategoryFoodsViewBody(category: category));
  }
}
