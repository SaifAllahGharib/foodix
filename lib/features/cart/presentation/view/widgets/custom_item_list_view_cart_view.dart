import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/app_assets.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/counter_product_widget.dart';
import 'package:foodix/core/widgets/custom_food_image.dart';
import 'package:foodix/core/widgets/custom_row_cost.dart';
import 'package:foodix/features/cart/presentation/viewmodel/cubits/cart/cart_cubit.dart';

class CustomItemListViewCartView extends StatelessWidget {
  final int index;

  const CustomItemListViewCartView({super.key, required this.index});

  void _incrementCountOfProducts(BuildContext context, int index) {
    context.read<CartCubit>().incrementCountOfProducts(index);
  }

  void _decrementCountOfProducts(BuildContext context, int index) {
    context.read<CartCubit>().decrementCountOfProducts(index);
  }

  int _getCountOfProducts(BuildContext context, int index) {
    return context.watch<CartCubit>().countOfProducts(index);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.responsive.height15),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomFoodImage(
                image: AppAssets.food,
                width: context.responsive.height104,
                height: context.responsive.height104,
              ),
              SizedBox(width: context.responsive.height20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Chekin", style: context.textStyle.s15W600),
                  context.responsive.height30.verticalSpace,
                  const CustomRowCost(
                    egp: 250,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const Spacer(),
              CounterProductWidget(
                increment: () => _incrementCountOfProducts(context, index),
                decrement: () => _decrementCountOfProducts(context, index),
                count: _getCountOfProducts(context, index),
                isCart: true,
              ),
            ],
          ),
          if (index != 4) SizedBox(height: context.responsive.height15),
          if (index != 4) const Divider(height: 1, color: AppColors.gray),
        ],
      ),
    );
  }
}
