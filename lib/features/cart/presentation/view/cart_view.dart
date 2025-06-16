import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/features/cart/presentation/view/widgets/cart_view_body.dart';
import 'package:foodix/features/cart/presentation/viewmodel/cubits/cart/cart_cubit.dart';

class CartView extends StatelessWidget {
  static const String id = "/cart_view";

  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: const Scaffold(
        body: CartViewBody(),
      ),
    );
  }
}
