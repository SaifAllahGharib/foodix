class FoodModel {
  final String? id;
  final String? foodImage;
  final String foodName;
  final String foodDesc;
  final num foodPrice;

  FoodModel({
    this.id,
    required this.foodImage,
    required this.foodName,
    required this.foodDesc,
    required this.foodPrice,
  });

  factory FoodModel.fromJson(Map<dynamic, dynamic> json) {
    return FoodModel(
      id: json['id']?.toString(),
      foodImage: json['foodImage'] ?? "",
      foodName: json['foodName'],
      foodDesc: json['foodDesc'],
      foodPrice: json['foodPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'foodImage': foodImage,
      'foodName': foodName,
      'foodDesc': foodDesc,
      'foodPrice': foodPrice,
    };
  }
}
