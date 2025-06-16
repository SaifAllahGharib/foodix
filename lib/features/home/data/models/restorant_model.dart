import '../../../../core/shared/models/category_model.dart';

class RestaurantModel {
  final String id;
  final List<CategoryModel> categories;

  RestaurantModel({required this.id, required this.categories});

  static List<RestaurantModel> fromJsonMap(Map<dynamic, dynamic> json) {
    return json.entries.map((entry) {
      final id = entry.key.toString();
      final restaurantData = entry.value as Map<dynamic, dynamic>?;
      final categoriesData =
          restaurantData?['categories'] as Map<dynamic, dynamic>?;

      final List<CategoryModel> categories = categoriesData != null
          ? categoriesData.entries.map((e) {
              final categoryMap = e.value as Map<dynamic, dynamic>;
              final merged = {'category': e.key, ...categoryMap};
              return CategoryModel.fromJson(merged);
            }).toList()
          : [];

      return RestaurantModel(id: id, categories: categories);
    }).toList();
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'categories': categories.map((c) => c.toJson()).toList()};
  }
}
