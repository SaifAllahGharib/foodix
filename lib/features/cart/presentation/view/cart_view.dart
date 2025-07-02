import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/di/dependency_injection.dart';
import 'package:foodix/features/cart/presentation/view/widgets/cart_view_body.dart';
import 'package:foodix/features/cart/presentation/viewmodel/cubits/cart/cart_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartCubit>(),
      child: const Scaffold(body: CartViewBody()),
    );
  }
}
