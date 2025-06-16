class FoodModel {
  final String? foodImage;
  final String foodName;
  final String foodDesc;
  final num foodPrice;

  FoodModel({
    required this.foodImage,
    required this.foodName,
    required this.foodDesc,
    required this.foodPrice,
  });

  factory FoodModel.fromJson(Map<dynamic, dynamic> json) {
    return FoodModel(
      foodImage: json['foodImage'] ?? "",
      foodName: json['foodName'],
      foodDesc: json['foodDesc'],
      foodPrice: json['foodPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foodImage': foodImage,
      'foodName': foodName,
      'foodDesc': foodDesc,
      'foodPrice': foodPrice,
    };
  }
}
