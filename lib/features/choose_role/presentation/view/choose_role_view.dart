import 'package:flutter/material.dart';  
import 'package:foodix/features/choose_role/presentation/view/widgets/choose_role_view_body.dart';  

class ChooseRoleView extends StatelessWidget {
  static const String id = "/choose_role";

  const ChooseRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: ChooseRoleViewBody()));
  }
}
