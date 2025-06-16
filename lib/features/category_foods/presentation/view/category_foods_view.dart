import 'package:flutter/material.dart';
import 'package:foodix/core/shared/models/ProductModel.dart';

import 'widgets/category_foods_view_body.dart';

class CategoryFoodsView extends StatelessWidget {
  static const String id = "/category_foods_view";

  final ProductModel productModel;

  const CategoryFoodsView({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CategoryFoodsViewBody(productModel: productModel));
  }
}
