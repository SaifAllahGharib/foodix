import 'package:flutter/material.dart';
import 'package:foodix/core/utils/di.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/utils/roles.dart';
import 'package:foodix/core/widgets/custom_back_button.dart';
import 'package:foodix/core/widgets/custom_button.dart';
import 'package:foodix/features/choose_role/presentation/view/widgets/role_widget.dart';
import 'package:foodix/features/signup/presentation/view/signup_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class ChooseRoleViewBody extends StatefulWidget {
  const ChooseRoleViewBody({super.key});

  @override
  State<ChooseRoleViewBody> createState() => _ChooseRoleViewBodyState();
}

class _ChooseRoleViewBodyState extends State<ChooseRoleViewBody> {
  final List<String> _roles = [
    getIt<Seller>().toString(),
    getIt<Buyer>().toString(),
  ];

  final List<IconData> _icons = [
    Icons.storefront_outlined,
    Icons.person_outline,
  ];

  int _selectedIndex = 0;

  String get _selectedRole => _roles.elementAt(_selectedIndex);

  void _onRoleSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20),
      child: Column(
        children: [
          const CustomBackButton(),
          SizedBox(height: Dimensions.height20),
          Container(
            width: Dimensions.height45 * 0.9,
            height: Dimensions.height45 * 0.9,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [AppColors.primaryColor, AppColors.disabledColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Icon(
              Icons.person_2_outlined,
              color: Colors.white,
              size: Dimensions.iconSize24,
            ),
          ),
          SizedBox(height: Dimensions.height20),
          Text(
            context.translate.selectRole,
            style: Styles.textStyle18(context),
          ),
          SizedBox(height: Dimensions.height20),
          Expanded(
            child: ListView.builder(
              itemCount: _roles.length,
              itemBuilder: (context, index) {
                return RoleWidget(
                  onTap: () => _onRoleSelected(index),
                  selected: _selectedIndex == index,
                  role: _roles[index],
                  icon: _icons[index],
                );
              },
            ),
          ),
          CustomButton(
            isEnabled: true,
            text: context.translate.continueText,
            onClick: () => _goToSignup(_selectedRole),
          ),
        ],
      ),
    );
  }

  void _goToSignup(String role) {
    context.pushReplacement(SignupView.id, extra: role);
  }
}
