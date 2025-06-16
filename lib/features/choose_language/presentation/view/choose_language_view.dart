import 'package:flutter/material.dart';
import 'package:foodix/features/choose_language/presentation/view/widgets/choose_language_view_body.dart';

class ChooseLanguageView extends StatelessWidget {
  const ChooseLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChooseLanguageViewBody(),
    );
  }
}
