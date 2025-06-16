import 'food_model.dart';

class ProductModel {
  String? category;
  List<FoodModel>? foods;

  ProductModel({
    this.category,
    this.foods,
  });

  factory ProductModel.fromJson(Map<dynamic, dynamic> json) {
    return ProductModel(
      category: json['category'],
      foods: json['foods'] != null
          ? (json['foods'] as Map<dynamic, dynamic>)
              .values
              .map((item) => FoodModel.fromJson(item))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    if (foods != null) {
      map['foods'] = foods?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
