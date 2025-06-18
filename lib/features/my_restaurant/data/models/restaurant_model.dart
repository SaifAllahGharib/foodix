import '../../../../core/shared/models/category_model.dart';

class RestaurantModel {
  final String? id;
  final String? name;
  final String? imageUrl;
  final double? rating;
  final int? deliveryTime;
  final double? deliveryCost;
  final String? openTime;
  final String? closeTime;
  final List<CategoryModel>? categories;

  RestaurantModel({
    required this.id,
    required this.name,
    this.imageUrl,
    this.rating,
    required this.deliveryTime,
    required this.deliveryCost,
    required this.openTime,
    required this.closeTime,
    this.categories,
  });

  factory RestaurantModel.fromJson(Map<dynamic, dynamic> json) {
    return RestaurantModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      deliveryTime: json['deliveryTime'] as int?,
      deliveryCost: (json['deliveryCost'] as num?)?.toDouble(),
      openTime: json['openTime'] as String?,
      closeTime: json['closeTime'] as String?,
      categories: (json['categories'] as Map<dynamic, dynamic>?)?.values
          .map((e) => CategoryModel.fromJson(e))
          .toList(),
    );
  }

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

  bool get isValid {
    return id != null &&
        name != null &&
        deliveryTime != null &&
        deliveryCost != null &&
        openTime != null &&
        closeTime != null;
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
        for (var category in categories ?? [])
          category.categoryName!: category.toJson(),
      },
    };
  }
}
