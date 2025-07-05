import 'package:flutter/material.dart';
import 'package:foodix/core/di/dependency_injection.dart';
import 'package:foodix/core/routing/app_route_name.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/utils/roles.dart';
import 'package:foodix/core/widgets/app_button.dart';
import 'package:foodix/features/choose_role/presentation/view/widgets/role_widget.dart';

import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/widgets/custom_back_button.dart';

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
      padding: EdgeInsets.all(context.responsive.height20),
      child: Column(
        children: [
          const CustomBackButton(),
          context.responsive.height20.verticalSpace,
          Container(
            width: context.responsive.height40,
            height: context.responsive.height40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Icon(
              Icons.person_2_outlined,
              color: Colors.white,
              size: context.responsive.iconSize24,
            ),
          ),
          context.responsive.height20.verticalSpace,
          Text(context.tr.selectRole, style: context.textStyle.s18W600),
          context.responsive.height20.verticalSpace,
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
          AppButton(
            isEnabled: true,
            text: context.tr.continueText,
            onClick: () => _goToSignup(_selectedRole),
          ),
        ],
      ),
    );
  }

  void _goToSignup(String role) {
    context.navigator.pushReplacementNamed(
      AppRouteName.signup,
      arguments: role,
    );
  }
}
