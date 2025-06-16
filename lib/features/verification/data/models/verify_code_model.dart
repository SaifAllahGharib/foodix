class VerifyCodeModel {
  final String email;
  final String code;

  VerifyCodeModel({required this.email, required this.code});

  factory VerifyCodeModel.fromJson(Map<String, dynamic> json) {
    return VerifyCodeModel(
      email: json['email'],
      code: json['verification_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'verification_code': code,
    };
  }
}
