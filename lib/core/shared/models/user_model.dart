class UserModel {
  final String? uid;
  final String? name;
  final String? email;
  final String? phone;
  final String? role;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.phone,
    this.role,
  });

  factory UserModel.fromJson(Map<Object?, Object?> json) {
    return UserModel(
      uid: json['uid'].toString() ?? "",
      name: json['name'].toString() ?? "",
      email: json['email'].toString() ?? "",
      phone: json['phone'].toString() ?? "",
      role: json['role'].toString() ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
    };
  }
}
