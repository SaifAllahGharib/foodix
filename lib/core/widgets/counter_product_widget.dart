import 'package:flutter/material.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';

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
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.height10 * 0.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20 * 5),
        border: Border.all(
          color: AppColors.gray,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: increment,
            icon: const Icon(
              Icons.add,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(width: Dimensions.width15),
          Text(
            "$count",
            style: Styles.textStyle15(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(width: Dimensions.width15),
          IconButton(
            onPressed: decrement,
            icon: Icon(
              Icons.remove,
              color: count == 1
                  ? isCart
                      ? AppColors.primaryColor
                      : Colors.grey
                  : AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
