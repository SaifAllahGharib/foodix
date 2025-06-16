import 'package:flutter/material.dart';
import 'package:foodix/features/details_order/presentation/view/widgets/details_order_view_body.dart';

class DetailsOrderView extends StatelessWidget {
  static const String id = "/details_view";

  const DetailsOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: DetailsOrderViewBody());
  }
}
