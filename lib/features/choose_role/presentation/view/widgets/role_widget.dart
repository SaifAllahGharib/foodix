import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../../../../../core/styles/app_colors.dart';

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
        margin: EdgeInsets.only(bottom: context.responsive.padding10),
        padding: EdgeInsets.all(context.responsive.padding10),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.secondary.withOpacity(0.06)
              : Colors.white,
          borderRadius: BorderRadius.circular(context.responsive.radius10),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.whiteGray,
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
                    size: context.responsive.iconSize24,
                    color: selected ? AppColors.primary : Colors.black,
                  ),
                  context.responsive.width30.horizontalSpace,
                  Text(
                    role,
                    style: context.textStyle.s18W600.copyWith(
                      color: selected ? AppColors.primary : Colors.black,
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
                color: AppColors.primary,
                size: context.responsive.iconSize20,
              ),
          ],
        ),
      ),
    );
  }
}
