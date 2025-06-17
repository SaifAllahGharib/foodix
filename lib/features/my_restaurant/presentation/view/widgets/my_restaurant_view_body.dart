import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/widgets/custom_back_button.dart';
import 'package:foodix/core/widgets/custom_button.dart';
import 'package:foodix/core/widgets/time_picker_widget.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class MyRestaurantViewBody extends StatefulWidget {
  const MyRestaurantViewBody({super.key});

  @override
  State<MyRestaurantViewBody> createState() => _MyRestaurantViewBodyState();
}

class _MyRestaurantViewBodyState extends State<MyRestaurantViewBody> {
  late final TextEditingController _nameController;
  late final TextEditingController _imageUrlController;
  late final TextEditingController _deliveryTimeController;
  late final TextEditingController _deliveryCostController;

  TimeOfDay? _openTime;
  TimeOfDay? _closeTime;

  @override
  void initState() {
    _nameController = TextEditingController();
    _imageUrlController = TextEditingController();
    _deliveryTimeController = TextEditingController();
    _deliveryCostController = TextEditingController();
    super.initState();
  }

  @override
  dispose() {
    _nameController.dispose();
    _imageUrlController.dispose();
    _deliveryTimeController.dispose();
    _deliveryCostController.dispose();
    super.dispose();
  }

  Future<void> _pickTime(BuildContext context, bool isOpenTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isOpenTime
          ? (_openTime ?? TimeOfDay.now())
          : (_closeTime ?? TimeOfDay.now()),
    );
    if (picked != null) {
      setState(() {
        if (isOpenTime) {
          _openTime = picked;
        } else {
          _closeTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.height20,
        vertical: Dimensions.height20 * 1.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackButton(),
          SizedBox(height: Dimensions.height20),
          Text(
            context.translate.addRestaurantInfo,
            style: Styles.textStyle20(
              context,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Dimensions.height20),
          CustomTextFormField(
            controller: _nameController,
            label: context.translate.labelName,
            hint: context.translate.hintNameRestaurant,
          ),
          CustomTextFormField(
            controller: _deliveryTimeController,
            label: context.translate.labelDeliveryTime,
            hint: context.translate.hintDeliveryTime,
          ),
          CustomTextFormField(
            controller: _deliveryCostController,
            label: context.translate.labelDeliveryCost,
            hint: context.translate.hintDeliveryCost,
          ),
          TimePickerWidget(
            label: context.translate.openTime,
            time: _openTime,
            onTap: () => _pickTime(context, true),
          ),
          TimePickerWidget(
            label: context.translate.closeTime,
            time: _closeTime,
            onTap: () => _pickTime(context, false),
          ),
          SizedBox(height: Dimensions.height30),
          CustomButton(text: context.translate.saveRestaurant, onClick: () {}),
        ],
      ),
    );
  }
}
