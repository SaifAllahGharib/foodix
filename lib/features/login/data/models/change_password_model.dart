class ChangePasswordModel {
  final String email;
  final String password;
  final String verifyCode;

  ChangePasswordModel({
    required this.email,
    required this.password,
    required this.verifyCode,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      email: json['email'],
      password: json['password'],
      verifyCode: json['verification_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      "verification_code": verifyCode,
    };
  }
}
