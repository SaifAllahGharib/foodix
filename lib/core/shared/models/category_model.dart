import 'food_model.dart';

class CategoryModel {
  final String? id;
  final String? categoryName;
  final List<FoodModel>? foods;

  CategoryModel({this.categoryName, this.foods, this.id});

  factory CategoryModel.fromJson(Map<dynamic, dynamic> json) {
    return CategoryModel(
      id: json['id']?.toString(),
      categoryName: json['category'],
      foods: json['foods'] != null
          ? (json['foods'] as Map<dynamic, dynamic>).values
                .map((item) => FoodModel.fromJson(item))
                .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category'] = categoryName;
    if (foods != null) {
      map['foods'] = foods?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
