bool phoneValidator(String phone) {
  final phoneRegex = RegExp(r"^\d{11}$");
  return phoneRegex.hasMatch(phone);
}
