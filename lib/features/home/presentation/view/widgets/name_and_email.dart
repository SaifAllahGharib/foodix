import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/viewmodel/cubits/local_cubit.dart';
import 'package:foodix/core/widgets/custom_text.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_edit_name_widget.dart';

class NameAndEmail extends StatelessWidget {
  final String name;
  final String email;

  const NameAndEmail({
    super.key,
    required this.name,
    required this.email,
  });

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      barrierColor: const Color(0x77909090),
      backgroundColor: Colors.white,
      sheetAnimationStyle: const AnimationStyle(
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.easeInBack,
      ),
      builder: (context) {
        return const CustomEditNameWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: name,
                textSize: Dimensions.height20 * 1.2,
                alignment: context.watch<LocalCubit>().isArabic
                    ? Alignment.topRight
                    : Alignment.topLeft,
              ),
              Text(
                email,
                style: Styles.textStyle15(context)
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          IconButton(
            onPressed: () => _showBottomSheet(context),
            icon: const Icon(
              Icons.edit,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
