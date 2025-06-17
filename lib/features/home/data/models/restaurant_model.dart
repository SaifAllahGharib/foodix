import '../../../../core/shared/models/category_model.dart';

class RestaurantModel {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final String deliveryTime;
  final String deliveryCost;
  final String openTime;
  final String closeTime;

  final List<CategoryModel> categories;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.deliveryTime,
    required this.deliveryCost,
    required this.openTime,
    required this.closeTime,
    required this.categories,
  });

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

      return RestaurantModel(
        id: id,
        categories: categories,
        name: restaurantData?["name"],
        imageUrl: restaurantData?["imageUrl"],
        rating: restaurantData?["rating"],
        deliveryTime: restaurantData?["deliveryTime"],
        deliveryCost: restaurantData?["deliveryCost"],
        openTime: restaurantData?["openTime"],
        closeTime: restaurantData?["closeTime"],
      );
    }).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'rating': rating,
      'deliveryTime': deliveryTime,
      'deliveryCost': deliveryCost,
      'openTime': openTime,
      'closeTime': closeTime,
      'categories': {
        for (var category in categories)
          category.categoryName!: category.toJson(),
      },
    };
  }
}
