import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_edit_field_widget.dart';

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
          label: context.tr.newName,
          hint: context.tr.hintName,
          onClick: () => _updateName(),
          onChanged: (val) => _validation(),
          isEnabled: context.watch<ProfileCubit>().isEnabled,
        );
      },
    );
  }

  void _updateName() {
    context.navigator.pop();
    context.read<ProfileCubit>().updateName(_editName.text);
  }

  void _validation() {
    context.read<ProfileCubit>().enableButton(_editName);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.responsive.height20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.name, style: context.textStyle.s30W600),
              Text(widget.email, style: context.textStyle.s15W500),
            ],
          ),
          IconButton(
            onPressed: () => _showBottomSheet(context),
            icon: const Icon(Icons.edit, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
