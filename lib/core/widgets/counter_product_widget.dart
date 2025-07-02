import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';

class CounterProductWidget extends StatelessWidget {
  final void Function() increment;
  final void Function() decrement;
  final int count;
  final bool isCart;

  const CounterProductWidget({
    super.key,
    required this.increment,
    required this.decrement,
    required this.count,
    this.isCart = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.responsive.height5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.responsive.radius100),
        border: Border.all(color: AppColors.gray, width: 1),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: increment,
            icon: const Icon(Icons.add, color: AppColors.primary),
          ),
          SizedBox(width: context.responsive.width15),
          Text("$count", style: context.textStyle.s15W600),
          SizedBox(width: context.responsive.width15),
          IconButton(
            onPressed: decrement,
            icon: Icon(
              Icons.remove,
              color: count == 1
                  ? isCart
                        ? AppColors.primary
                        : Colors.grey
                  : AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
