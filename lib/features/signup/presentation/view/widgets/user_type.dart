import 'package:flutter/material.dart';

import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';

class UserType extends StatefulWidget {
  final String type;
  final void Function(String? val) onChange;

  const UserType({
    super.key,
    required this.type,
    required this.onChange,
  });

  @override
  State<StatefulWidget> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  final List<String> userTypes = ["vendor", "buyer"];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        label: Text(
          "type",
          style: const TextStyle(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            Dimensions.radius10,
          ),
          borderSide: const BorderSide(
            color: AppColors.gray,
            width: 1.3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
      ),
      value: widget.type,
      items: userTypes.map((type) {
        return DropdownMenuItem(
          value: type,
          child: Text(type),
        );
      }).toList(),
      onChanged: widget.onChange,
    );
  }
}
