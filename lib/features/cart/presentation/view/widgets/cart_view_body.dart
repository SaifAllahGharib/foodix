import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/features/cart/presentation/view/widgets/bottom_section_cart_view.dart';
import 'package:foodix/features/cart/presentation/view/widgets/custom_app_bar_cart_view.dart';
import 'package:foodix/features/cart/presentation/view/widgets/custom_list_view_cart_view.dart';
import 'package:foodix/features/cart/presentation/view/widgets/information_payment_section.dart';
import 'package:foodix/features/cart/presentation/viewmodel/cubits/cart/cart_cubit.dart';
import 'package:foodix/features/cart/presentation/viewmodel/cubits/cart/cart_state.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBarCartView(),
            const CustomListViewCartView(),
            context.responsive.height10.verticalSpace,
            const InformationPaymentSection(),
            const BottomSectionCartView(),
          ],
        );
      },
    );
  }
}
