import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/home/home_cubit.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int index) onIndexChanged;

  const CustomBottomNavigationBar({super.key, required this.onIndexChanged});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.responsive.padding12 * 0.7),
      margin: EdgeInsets.all(context.responsive.padding20),
      height: context.responsive.height45 * 1.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.responsive.radius20 * 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(3, (index) {
          return InkWell(
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            onTap: () => widget.onIndexChanged(index),
            child: _buildIconWithLine(
              index: index,
              isSelected: index == context.watch<HomeCubit>().selectedIndex,
            ),
          );
        }),
      ),
    );
  }

  Widget _buildIconWithLine({required int index, required bool isSelected}) {
    final List<IconData> iconData = [
      Icons.home,
      Icons.shopping_cart_outlined,
      Icons.person,
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: context.responsive.width10 * 0.8,
          width: isSelected ? context.responsive.screenWidth * 0.055 : 0,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(context.responsive.radius10),
          ),
        ),
        SizedBox(height: context.responsive.height3),
        Icon(
          iconData[index],
          color: isSelected ? AppColors.primary : AppColors.gray,
          size: context.responsive.screenWidth * 0.055,
        ),
      ],
    );
  }
}
