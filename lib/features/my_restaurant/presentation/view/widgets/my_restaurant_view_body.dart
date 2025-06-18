import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/utils/functions/snack_bar.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/widgets/custom_back_button.dart';
import 'package:foodix/core/widgets/custom_button.dart';
import 'package:foodix/core/widgets/time_picker_widget.dart';
import 'package:foodix/features/my_restaurant/data/models/restaurant_model.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/di.dart';
import '../../../../../core/utils/my_shared_preferences.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../viewmodel/cubits/my_restaurant/my_restaurant_cubit.dart';
import '../../viewmodel/cubits/my_restaurant/my_restaurant_state.dart';
import 'my_restaurant_loading_widget.dart';

class MyRestaurantViewBody extends StatefulWidget {
  const MyRestaurantViewBody({super.key});

  @override
  State<MyRestaurantViewBody> createState() => _MyRestaurantViewBodyState();
}

class _MyRestaurantViewBodyState extends State<MyRestaurantViewBody> {
  late final TextEditingController _nameController;
  late final TextEditingController _deliveryTimeController;
  late final TextEditingController _deliveryCostController;
  late final MySharedPreferences _mySharedPreferences;

  TimeOfDay? _openTime;
  TimeOfDay? _closeTime;

  @override
  void initState() {
    _nameController = TextEditingController();
    _deliveryTimeController = TextEditingController();
    _deliveryCostController = TextEditingController();
    _mySharedPreferences = getIt<MySharedPreferences>();

    super.initState();
  }

  @override
  dispose() {
    _nameController.dispose();
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
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Colors.white,
              hourMinuteTextColor: Colors.black,
              dialHandColor: AppColors.primaryColor,
              dialBackgroundColor: Colors.grey.shade200,
              entryModeIconColor: AppColors.primaryColor,
              hourMinuteColor: AppColors.primaryColor.withOpacity(0.1),
              dayPeriodColor: AppColors.primaryColor,
            ),
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
              ),
            ),
          ),
          child: child!,
        );
      },
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

  String _formatTime(BuildContext context, TimeOfDay? time) {
    if (time == null) return context.translate.selectTime;
    final localizations = MaterialLocalizations.of(context);
    return localizations.formatTimeOfDay(time, alwaysUse24HourFormat: false);
  }

  void _validationFields() {
    context.read<MyRestaurantCubit>().validateFields(
      controllers: [
        _nameController,
        _deliveryTimeController,
        _deliveryCostController,
      ],
      openTime: _openTime,
      closeTime: _closeTime,
    );
  }

  void _createRestaurant(RestaurantModel restaurant) {
    context.read<MyRestaurantCubit>().createRestaurant(restaurant);
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => const MyRestaurantLoadingWidget(),
    );
  }

  void _handleState(MyRestaurantState state) {
    if (state is MyRestaurantLoading) {
      _showLoadingDialog(context);
    } else if (state is MyRestaurantCreated) {
      context.pop();
      context.pop();
    } else if (state is MyRestaurantFailure) {
      snackBar(context: context, text: state.errorMsg);
    }
  }

  List<String?> _getMyRestaurantInfo(MySharedPreferences mySharedPreferences) {
    return [
      mySharedPreferences.getString("restaurantName"),
      mySharedPreferences.getString("deliveryTime"),
      mySharedPreferences.getString("deliveryCost"),
      mySharedPreferences.getString("openTime"),
      mySharedPreferences.getString("closeTime"),
    ];
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
          _customMyRestaurantTextFormField(
            controller: _nameController,
            label: context.translate.labelName,
            hint:
                _getMyRestaurantInfo(_mySharedPreferences)[0] ??
                context.translate.hintName,
            onClickEdit: () {},
          ),
          SizedBox(height: Dimensions.height10),
          _customMyRestaurantTextFormField(
            controller: _deliveryTimeController,
            label: context.translate.labelDeliveryTime,
            hint:
                _getMyRestaurantInfo(_mySharedPreferences)[1] ??
                context.translate.hintDeliveryTime,
            onClickEdit: () {},
          ),
          SizedBox(height: Dimensions.height10),
          _customMyRestaurantTextFormField(
            controller: _deliveryCostController,
            label: context.translate.labelDeliveryCost,
            hint:
                _getMyRestaurantInfo(_mySharedPreferences)[2] ??
                context.translate.hintDeliveryCost,
            onClickEdit: () {},
          ),
          SizedBox(height: Dimensions.height10),
          TimePickerWidget(
            label: context.translate.openTime,
            time:
                _getMyRestaurantInfo(_mySharedPreferences)[3] ??
                _formatTime(context, _openTime),
            onTap: () async {
              await _pickTime(context, true);
              _validationFields();
            },
          ),
          SizedBox(height: Dimensions.height10),
          TimePickerWidget(
            label: context.translate.closeTime,
            time:
                _getMyRestaurantInfo(_mySharedPreferences)[4] ??
                _formatTime(context, _closeTime),
            onTap: () async {
              await _pickTime(context, false);
              _validationFields();
            },
          ),
          SizedBox(height: Dimensions.height30),
          BlocConsumer<MyRestaurantCubit, MyRestaurantState>(
            listener: (context, state) => _handleState(state),
            builder: (context, state) {
              return CustomButton(
                text: context.translate.saveRestaurant,
                isEnabled: context.watch<MyRestaurantCubit>().isValid,
                onClick: () {
                  _createRestaurant(
                    RestaurantModel(
                      id: getIt<MySharedPreferences>().getIdUser()!,
                      name: _nameController.text,
                      deliveryTime: int.parse(
                        _deliveryTimeController.text.trim(),
                      ),
                      deliveryCost: double.parse(
                        _deliveryCostController.text.trim(),
                      ),
                      openTime: _formatTime(context, _openTime),
                      closeTime: _formatTime(context, _closeTime),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _customMyRestaurantTextFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required VoidCallback onClickEdit,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: CustomTextFormField(
            controller: controller,
            label: label,
            hint: hint,
            onChanged: (val) => _validationFields(),
          ),
        ),
        if (!_getMyRestaurantInfo(
          _mySharedPreferences,
        ).any((element) => element == null || element.isEmpty))
          SizedBox(width: Dimensions.width20),
        if (!_getMyRestaurantInfo(
          _mySharedPreferences,
        ).any((element) => element == null || element.isEmpty))
          Container(
            width: Dimensions.height45 * 1.05,
            height: Dimensions.height45 * 1.05,
            decoration: BoxDecoration(
              color: AppColors.gray.withOpacity(0.2),
              borderRadius: BorderRadius.circular(Dimensions.radius10),
            ),
            child: IconButton(
              onPressed: onClickEdit,
              icon: const Icon(Icons.edit, color: AppColors.primaryColor),
            ),
          ),
      ],
    );
  }
}
