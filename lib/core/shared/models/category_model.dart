import 'food_model.dart';

class CategoryModel {
  String? categoryName;
  List<FoodModel>? foods;

  CategoryModel({this.categoryName, this.foods});

  factory CategoryModel.fromJson(Map<dynamic, dynamic> json) {
    return CategoryModel(
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
    map['category'] = categoryName;
    if (foods != null) {
      map['foods'] = foods?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
