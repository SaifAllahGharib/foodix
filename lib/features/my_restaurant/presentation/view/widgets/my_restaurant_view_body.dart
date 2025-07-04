import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/enums.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/app_button.dart';
import 'package:foodix/core/widgets/custom_backgets/app_button.dart';
import 'package:foodix/features/home/presentation/view/home_view.dart';
import 'package:foodix/features/my_restaurant/data/models/restaurant_model.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/utils/my_shared_preferences.dart';
import '../../../../../core/widgets/custom_dialog_loading_widget.dart';
import '../../../../../core/widgets/custom_edit_field_widget.dart';
import '../../viewmodel/cubits/my_restaurant/my_restaurant_cubit.dart';
import '../../viewmodel/cubits/my_restaurant/my_restaurant_state.dart';
import 'custom_my_restaurant_text_form_field_and_time.dart';
import 'custom_my_restaurant_time_display.dart';

class MyRestaurantViewBody extends StatefulWidget {
  const MyRestaurantViewBody({super.key});

  @override
  State<MyRestaurantViewBody> createState() => _MyRestaurantViewBodyState();
}

class _MyRestaurantViewBodyState extends State<MyRestaurantViewBody> {
  late final TextEditingController _nameController;
  late final TextEditingController _deliveryTimeController;
  late final TextEditingController _deliveryCostController;
  late final SharedPreferencesService _SharedPreferencesService;
  late final TextEditingController _updateNameController;
  late final TextEditingController _updateDeliveryTimeController;
  late final TextEditingController _updateDeliveryCostController;

  TimeOfDay? _openTime;
  TimeOfDay? _closeTime;

  @override
  void initState() {
    _nameController = TextEditingController();
    _deliveryTimeController = TextEditingController();
    _deliveryCostController = TextEditingController();
    _updateNameController = TextEditingController();
    _updateDeliveryTimeController = TextEditingController();
    _updateDeliveryCostController = TextEditingController();
    _SharedPreferencesService = getIt<SharedPreferencesService>();

    super.initState();
  }

  @override
  dispose() {
    _nameController.dispose();
    _deliveryTimeController.dispose();
    _deliveryCostController.dispose();
    _updateNameController.dispose();
    _updateDeliveryTimeController.dispose();
    _updateDeliveryCostController.dispose();
    _openTime = null;
    _closeTime = null;

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _getMyRestaurantInfo(_SharedPreferencesService);
    super.didChangeDependencies();
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
              dialHandColor: AppColors.primary,
              dialBackgroundColor: Colors.grey.shade200,
              entryModeIconColor: AppColors.primary,
              hourMinuteColor: AppColors.primary.withOpacity(0.1),
              dayPeriodColor: AppColors.primary,
            ),
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: AppColors.primary),
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

        _validationFields();
      });
    }
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

  String _formatTime(BuildContext context, TimeOfDay? time) {
    if (time == null) return context.tr.selectTime;
    final localizations = MaterialLocalizations.of(context);
    return localizations.formatTimeOfDay(time, alwaysUse24HourFormat: false);
  }

  void _createRestaurant(RestaurantModel restaurant) {
    context.read<MyRestaurantCubit>().createRestaurant(restaurant);
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => const CustomDialogLoadingWidget(),
    );
  }

  void _handleState(MyRestaurantState state) async {
    if (state is MyRestaurantLoading) {
      _showLoadingDialog();
    } else if (state is MyRestaurantCreated) {
      context.pop();
      context.go(HomeView.id);
    } else if (state is MyRestaurantFailure) {
      snackBar(context: context, text: state.errorMsg);
    }
  }

  List<String?> _getMyRestaurantInfo(
    SharedPreferencesService SharedPreferencesService,
  ) {
    return [
      SharedPreferencesService.getString(
        RestaurantInfoParams.restaurantName.toString(),
      ),
      SharedPreferencesService.getString(
        RestaurantInfoParams.deliveryTime.toString(),
      ),
      SharedPreferencesService.getString(
        RestaurantInfoParams.deliveryCost.toString(),
      ),
      SharedPreferencesService.getString(
        RestaurantInfoParams.openTime.toString(),
      ),
      SharedPreferencesService.getString(
        RestaurantInfoParams.closeTime.toString(),
      ),
    ];
  }

  bool _restaurantInfoIsEmpty(List<String?> info) {
    return info.any((e) => e == null);
  }

  void _validateUpdateField(TextEditingController controller) {
    context.read<MyRestaurantCubit>().validateUpdateField(controller);
  }

  void _showBottomSheet({
    required TextEditingController controller,
    required VoidCallback onClick,
    TextInputType textInputType = TextInputType.text,
    required String label,
    required String hint,
  }) {
    showModalBottomSheet(
      context: context,
      barrierColor: const Color(0x77909090),
      backgroundColor: Colors.white,
      sheetAnimationStyle: const AnimationStyle(
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.easeInBack,
      ),
      builder: (bottomContext) {
        return BlocProvider.value(
          value: context.read<MyRestaurantCubit>(),
          child: BlocBuilder<MyRestaurantCubit, MyRestaurantState>(
            builder: (context, state) {
              return CustomEditFieldWidget(
                controller: controller,
                onClick: onClick,
                textInputType: textInputType,
                label: label,
                hint: hint,
                onChanged: (val) => _validateUpdateField(controller),
                isEnabled: context.watch<MyRestaurantCubit>().isValid,
              );
            },
          ),
        );
      },
    );
  }

  void _whenUpdateSuccess(String key, String value) async {
    context.read<MyRestaurantCubit>().resetValidation();
    await _SharedPreferencesService.storeString(key, value);
    context.pop();
    setState(() {});
  }

  void _handleStateUpdateFields(state) {
    if (state is MyRestaurantLoading) {
      _showLoadingDialog();
    } else if (state is MyRestaurantNameUpdated) {
      _whenUpdateSuccess(
        RestaurantInfoParams.restaurantName.toString(),
        _updateNameController.text,
      );
    } else if (state is MyRestaurantTimeDeliveryUpdated) {
      _whenUpdateSuccess(
        RestaurantInfoParams.deliveryTime.toString(),
        _updateDeliveryTimeController.text,
      );
    } else if (state is MyRestaurantCostDeliveryUpdated) {
      _whenUpdateSuccess(
        RestaurantInfoParams.deliveryCost.toString(),
        _updateDeliveryCostController.text,
      );
    } else if (state is MyRestaurantOpenTimeUpdated) {
      _whenUpdateSuccess(
        RestaurantInfoParams.openTime.toString(),
        _formatTime(context, _openTime),
      );
    } else if (state is MyRestaurantCloseTimeUpdated) {
      _whenUpdateSuccess(
        RestaurantInfoParams.closeTime.toString(),
        _formatTime(context, _closeTime),
      );
    } else if (state is MyRestaurantFailure) {
      context.pop();
      snackBar(context: context, text: state.errorMsg);
    }
  }

  void _updateName() async {
    context.pop();
    await context.read<MyRestaurantCubit>().updateRestaurantName(
      _updateNameController.text,
    );
  }

  void _updateTimeDelivery() async {
    context.pop();
    await context.read<MyRestaurantCubit>().updateRestaurantTimeDelivery(
      int.tryParse(_updateDeliveryTimeController.text) ?? 0,
    );
  }

  void _updateCostDelivery() async {
    context.pop();
    await context.read<MyRestaurantCubit>().updateRestaurantCostDelivery(
      int.tryParse(_updateDeliveryCostController.text) ?? 0,
    );
  }

  void _updateOpenTime() async {
    await _pickTime(context, true);
    await context.read<MyRestaurantCubit>().updateRestaurantOpenTime(
      _formatTime(context, _openTime),
    );
  }

  void _updateCloseTime() async {
    await _pickTime(context, false);
    await context.read<MyRestaurantCubit>().updateRestaurantCloseTime(
      _formatTime(context, _closeTime),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: context.responsive.height20,
        vertical: context.responsive.height20 * 1.5,
      ),
      child: Column(
        children: [
          BlocListener<MyRestaurantCubit, MyRestaurantState>(
            listener: (context, state) => _handleStateUpdateFields(state),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackButton(),
                context.responsive.height20.verticalSpace,
                Text(
                  context.tr.restaurantInfo,
                  style: AppStyles.textStyle20(
                    context,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
                context.responsive.height20.verticalSpace,
                _buildTextFormField(
                  controller: _nameController,
                  label: context.tr.labelName,
                  resInfo: 0,
                  hint: context.tr.hintNameRestaurant,
                  onClickEdit: () => _showBottomSheet(
                    controller: _updateNameController,
                    label: context.tr.newName,
                    hint: context.tr.hintNameRestaurant,
                    onClick: () => _updateName(),
                  ),
                ),
                context.responsive.height10.verticalSpace,
                _buildTextFormField(
                  controller: _deliveryTimeController,
                  label: context.tr.labelDeliveryTime,
                  resInfo: 1,
                  textInputType: TextInputType.number,
                  hint: context.tr.hintDeliveryTime,
                  onClickEdit: () => _showBottomSheet(
                    controller: _updateDeliveryTimeController,
                    textInputType: TextInputType.number,
                    label: context.tr.labelDeliveryTime,
                    hint: context.tr.hintDeliveryTime,
                    onClick: () => _updateTimeDelivery(),
                  ),
                ),
                context.responsive.height10.verticalSpace,
                _buildTextFormField(
                  controller: _deliveryCostController,
                  label: context.tr.labelDeliveryCost,
                  resInfo: 2,
                  textInputType: TextInputType.number,
                  hint: context.tr.hintDeliveryCost,
                  onClickEdit: () => _showBottomSheet(
                    controller: _updateDeliveryCostController,
                    textInputType: TextInputType.number,
                    label: context.tr.labelDeliveryCost,
                    hint: context.tr.hintDeliveryCost,
                    onClick: () => _updateCostDelivery(),
                  ),
                ),
                context.responsive.height10.verticalSpace,
                _buildTimePicker(
                  time: _openTime,
                  label: context.tr.openTime,
                  resInfo: 3,
                  onClickEdit: () => _updateOpenTime(),
                ),
                context.responsive.height10.verticalSpace,
                _buildTimePicker(
                  time: _closeTime,
                  isOpenTime: false,
                  label: context.tr.closeTime,
                  resInfo: 4,
                  onClickEdit: () => _updateCloseTime(),
                ),
              ],
            ),
          ),
          context.responsive.height30.verticalSpace,
          !_restaurantInfoIsEmpty(
                _getMyRestaurantInfo(_SharedPreferencesService),
              )
              ? const SizedBox.shrink()
              : BlocListener<MyRestaurantCubit, MyRestaurantState>(
                  listener: (context, state) => _handleState(state),
                  child: AppButton(
                    text: context.tr.saveRestaurant,
                    isEnabled: context.watch<MyRestaurantCubit>().isValid,
                    onClick: () => _createRestaurant(
                      RestaurantModel(
                        id: getIt<SharedPreferencesService>().getIdUser()!,
                        name: _nameController.text,
                        deliveryTime: int.tryParse(
                          _deliveryTimeController.text.trim(),
                        ),
                        deliveryCost: double.tryParse(
                          _deliveryCostController.text.trim(),
                        ),
                        openTime: _formatTime(context, _openTime),
                        closeTime: _formatTime(context, _closeTime),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required int resInfo,
    required String hint,
    required String label,
    required VoidCallback onClickEdit,
    TextInputType textInputType = TextInputType.text,
  }) {
    return CustomMyRestaurantTextFormField(
      controller: controller,
      textFieldValue:
          _getMyRestaurantInfo(_SharedPreferencesService)[resInfo] ?? "",
      hint: hint,
      onChanged: (_) => _validationFields(),
      label: label,
      textInputType: textInputType,
      onClickEdit: onClickEdit,
      restaurantInfoIsEmpty: _restaurantInfoIsEmpty(
        _getMyRestaurantInfo(_SharedPreferencesService),
      ),
    );
  }

  Widget _buildTimePicker({
    bool isOpenTime = true,
    required TimeOfDay? time,
    required int resInfo,
    required String label,
    required VoidCallback onClickEdit,
  }) {
    return CustomMyRestaurantTimeDisplay(
      label: label,
      textValue:
          _getMyRestaurantInfo(_SharedPreferencesService)[resInfo] ??
          _formatTime(context, time),
      time: _formatTime(context, time),
      restaurantInfoIsEmpty: _restaurantInfoIsEmpty(
        _getMyRestaurantInfo(_SharedPreferencesService),
      ),
      onTap: () async => await _pickTime(context, isOpenTime),
      onClickEdit: onClickEdit,
    );
  }
}
