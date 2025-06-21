import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/styles.dart';

class RoleWidget extends StatelessWidget {
  final String role;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const RoleWidget({
    super.key,
    required this.role,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.only(bottom: Dimensions.height10),
        padding: EdgeInsets.all(Dimensions.height10),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.disabledColor.withOpacity(0.06)
              : Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          border: Border.all(
            color: selected ? AppColors.primaryColor : AppColors.whiteGray,
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: Dimensions.iconSize24,
                    color: selected ? AppColors.primaryColor : Colors.black,
                  ),
                  SizedBox(width: Dimensions.width30),
                  Text(
                    role,
                    style: Styles.textStyle18(context).copyWith(
                      color: selected ? AppColors.primaryColor : Colors.black,
                      fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            if (selected)
              Icon(
                Icons.check,
                color: AppColors.primaryColor,
                size: Dimensions.iconSize20,
              ),
          ],
        ),
      ),
    );
  }
}
