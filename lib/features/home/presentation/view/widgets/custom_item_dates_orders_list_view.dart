import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/orders/orders_cubit.dart';

class CustomItemDatesOrdersListView extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final List<String> list;

  const CustomItemDatesOrdersListView({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.list,
  });

  void _setSelectedIndex(BuildContext context, int index) {
    context.read<OrdersCubit>().selectDayTab(index);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => _setSelectedIndex(context, index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: context.responsive.width30 * 2,
        ),
        margin: EdgeInsets.only(right: context.responsive.width30),
        decoration: BoxDecoration(
          color: selectedIndex == index ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(context.responsive.radius20 * 5),
          border: Border.all(width: 1, color: AppColors.primary),
        ),
        child: Center(
          child: Text(
            list[index],
            style: context.textStyle.s16W500.copyWith(
              color: selectedIndex == index ? Colors.white : AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
