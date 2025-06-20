import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/viewmodel/cubits/local_cubit.dart';
import 'package:foodix/core/widgets/custom_edit_field_widget.dart';
import 'package:foodix/core/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';

import '../../viewmodel/cubits/profile/profile_cubit.dart';

class NameAndEmail extends StatefulWidget {
  final String name;
  final String email;

  const NameAndEmail({super.key, required this.name, required this.email});

  @override
  State<NameAndEmail> createState() => _NameAndEmailState();
}

class _NameAndEmailState extends State<NameAndEmail> {
  late final TextEditingController _editName;

  @override
  void initState() {
    _editName = TextEditingController(text: widget.name);
    super.initState();
  }

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
        return CustomEditFieldWidget(
          controller: _editName,
          label: context.translate.newName,
          hint: context.translate.hintName,
          onClick: () => _updateName(),
          onChanged: (val) => _validation(),
          isEnabled: context.watch<ProfileCubit>().isEnabled,
        );
      },
    );
  }

  void _updateName() {
    context.pop();
    context.read<ProfileCubit>().updateName(_editName.text);
  }

  void _validation() {
    context.read<ProfileCubit>().enableButton(_editName);
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
                text: widget.name,
                textSize: Dimensions.height20 * 1.2,
                alignment: context.watch<LocalCubit>().isArabic
                    ? Alignment.topRight
                    : Alignment.topLeft,
              ),
              Text(
                widget.email,
                style: Styles.textStyle15(
                  context,
                ).copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          IconButton(
            onPressed: () => _showBottomSheet(context),
            icon: const Icon(Icons.edit, color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
