import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../../../../../core/styles/app_colors.dart';

class LangWidget extends StatelessWidget {
  final String lang;
  final String flag;
  final bool selected;
  final VoidCallback onTap;

  const LangWidget({
    super.key,
    required this.selected,
    required this.lang,
    required this.flag,
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
                  Image.asset(flag, height: 36),
                  context.responsive.width30.horizontalSpace,
                  Text(
                    lang,
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
