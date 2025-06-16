import 'package:flutter/material.dart';
import 'package:foodix/features/choose_type/presentation/view/widgets/choose_type_view_body.dart';

class ChooseTypeView extends StatelessWidget {
  static const String id = "/choose_type";

  const ChooseTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChooseTypeViewBody(),
    );
  }
}
