class ResponseModel {
  final String message;
  final Map<String, dynamic>? user;

  ResponseModel({required this.message, this.user});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      message: json['message'] ?? '',
      user:
          json['user'] != null ? Map<String, dynamic>.from(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'user': user,
    };
  }
}
