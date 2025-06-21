import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/styles.dart';

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
                  Image.asset(flag, height: 36),
                  SizedBox(width: Dimensions.width30),
                  Text(
                    lang,
                    style: Styles.textStyle18(context).copyWith(
                      color: selected ? AppColors.primaryColor : Colors.black,
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
