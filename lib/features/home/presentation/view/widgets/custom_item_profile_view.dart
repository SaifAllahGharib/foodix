import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';

class CustomItemProfileView extends StatelessWidget {
  final String title;
  final void Function() onClick;
  final bool dividerIsShowing;

  const CustomItemProfileView({
    super.key,
    required this.title,
    required this.onClick,
    this.dividerIsShowing = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      enableFeedback: false,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.responsive.height20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: context.textStyle.s18W600.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 28,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          SizedBox(height: context.responsive.height15),
          dividerIsShowing
              ? Padding(
                  padding: EdgeInsets.only(right: context.responsive.height20),
                  child: const Divider(height: 1, color: AppColors.gray),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
