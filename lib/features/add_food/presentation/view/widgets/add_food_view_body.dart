import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/shared/page_state.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/app_button.dart';
import 'package:foodix/core/widgets/custom_back_button.dart';
import 'package:foodix/core/widgets/loading.dart';
import 'package:foodix/features/add_food/presentation/view/widgets/custom_button_image_picker.dart';
import 'package:foodix/features/add_food/presentation/viewmodel/cubits/add_food/add_food_cubit.dart';
import 'package:foodix/features/add_food/presentation/viewmodel/cubits/add_food/add_food_state.dart';

import '../../../../../core/shared/functions/snack_bar.dart';
import '../../../../../core/shared/models/food_model.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class AddFoodViewBody extends StatefulWidget {
  final String categoryId;

  const AddFoodViewBody({super.key, required this.categoryId});

  @override
  State<AddFoodViewBody> createState() => _AddFoodViewBodyState();
}

class _AddFoodViewBodyState extends State<AddFoodViewBody> {
  late final TextEditingController _foodName;
  late final TextEditingController _foodDesc;
  late final TextEditingController _foodPrice;

  @override
  void initState() {
    _foodName = TextEditingController();
    _foodDesc = TextEditingController();
    _foodPrice = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _foodName.dispose();
    _foodDesc.dispose();
    _foodPrice.dispose();
    super.dispose();
  }

  void _validate(BuildContext context) {
    context.read<AddFoodCubit>().validation(
      name: _foodName,
      desc: _foodDesc,
      price: _foodPrice,
      image: context.read<AddFoodCubit>().state.pickedImage,
    );
  }

  void _pickImageFromCamera(BuildContext context) async {
    context.navigator.pop();
    await context.read<AddFoodCubit>().pickFromCamera();
  }

  void _pickImageFromGallery(BuildContext context) async {
    context.navigator.pop();
    await context.read<AddFoodCubit>().pickFromGallery();
  }

  void _addFood(BuildContext context) {
    context.read<AddFoodCubit>().addFood(
      widget.categoryId,
      FoodModel(
        foodImage: "",
        foodName: _foodName.text,
        foodDesc: _foodDesc.text,
        foodPrice: double.tryParse(_foodPrice.text) ?? 0.0,
      ),
    );
  }

  void _handleState(AddFoodState state) {
    if (state.status is PageSuccess) {
      context.navigator.pop();
    } else if (state.status is PageFailure) {
      context.navigator.pop();
      snackBar(context: context, text: (state.status as PageFailure).message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddFoodCubit, AddFoodState>(
      listener: (context, state) => _handleState(state),
      builder: (context, state) {
        if (state.status is PageLoading) return const Loading();

        return Padding(
          padding: EdgeInsets.all(context.responsive.padding20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                context.responsive.height20.verticalSpace,
                const CustomBackButton(),
                context.responsive.height45.verticalSpace,
                Text(context.tr.addFood, style: context.textStyle.s30W600),
                context.responsive.height45.verticalSpace,
                BlocSelector<AddFoodCubit, AddFoodState, String?>(
                  selector: (state) => state.pickedImage,
                  builder: (context, pickedImage) {
                    _validate(context);
                    return AppButtonImagePicker(
                      pickImageFromCamera: () => _pickImageFromCamera(context),
                      pickImageFromGallery: () =>
                          _pickImageFromGallery(context),
                      selectedImage: pickedImage,
                    );
                  },
                ),
                context.responsive.height20.verticalSpace,
                AppTextFormField(
                  controller: _foodName,
                  label: context.tr.foodName,
                  hint: context.tr.foodName,
                  onChanged: (val) => _validate(context),
                ),
                context.responsive.height10.verticalSpace,
                AppTextFormField(
                  controller: _foodDesc,
                  label: context.tr.foodDesc,
                  hint: context.tr.foodDesc,
                  onChanged: (val) => _validate(context),
                ),
                context.responsive.height10.verticalSpace,
                AppTextFormField(
                  controller: _foodPrice,
                  label: context.tr.foodCost,
                  hint: context.tr.foodCost,
                  textInputType: TextInputType.number,
                  onChanged: (val) => _validate(context),
                ),
                context.responsive.height30.verticalSpace,
                BlocSelector<AddFoodCubit, AddFoodState, bool>(
                  selector: (state) => state.isValid,
                  builder: (context, isValid) {
                    return AppButton(
                      text: context.tr.add,
                      isEnabled: isValid,
                      onClick: () => _addFood(context),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
