import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/utils/functions/snack_bar.dart';
import 'package:foodix/core/widgets/custom_back_button.dart';
import 'package:foodix/core/widgets/custom_button.dart';
import 'package:foodix/core/widgets/custom_text.dart';
import 'package:foodix/core/widgets/custom_text_form_field.dart';
import 'package:foodix/core/widgets/loading.dart';
import 'package:foodix/features/add_food/presentation/view/widgets/custom_button_image_picker.dart';
import 'package:foodix/features/add_food/presentation/viewmodel/cubits/add_food/add_food_cubit.dart';
import 'package:foodix/features/add_food/presentation/viewmodel/cubits/add_food/add_food_state.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/shared/models/food_model.dart';

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
  String? _imagePath;

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
      image: _imagePath,
    );
  }

  void _pickImageFromCamera(BuildContext context) async {
    GoRouter.of(context).pop();
    await context.read<AddFoodCubit>().pickFromCamera();
  }

  void _pickImageFromGallery(BuildContext context) async {
    GoRouter.of(context).pop();
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

  void _handleState(state) {
    if (state is AddFoodPickImage) {
      _imagePath = state.image!;
      _validate(context);
    } else if (state is AddFoodSuccess) {
      GoRouter.of(context).pop();
    } else if (state is AddFoodFailure) {
      GoRouter.of(context).pop();
      snackBar(context: context, text: state.errorMsg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddFoodCubit, AddFoodState>(
      listener: (context, state) => _handleState(state),
      builder: (context, state) {
        if (state is AddFoodLoading) return const Loading();

        return Padding(
          padding: EdgeInsets.all(Dimensions.height20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Dimensions.height20),
                const CustomBackButton(),
                SizedBox(height: Dimensions.height45),
                CustomText(text: context.translate.addFood),
                SizedBox(height: Dimensions.height45),
                CustomButtonImagePicker(
                  pickImageFromCamera: () => _pickImageFromCamera(context),
                  pickImageFromGallery: () => _pickImageFromGallery(context),
                  selectedImage: _imagePath,
                ),
                SizedBox(height: Dimensions.height20),
                CustomTextFormField(
                  controller: _foodName,
                  label: context.translate.foodName,
                  hint: context.translate.foodName,
                  onChanged: (val) => _validate(context),
                ),
                SizedBox(height: Dimensions.height10),
                CustomTextFormField(
                  controller: _foodDesc,
                  label: context.translate.foodDesc,
                  hint: context.translate.foodDesc,
                  onChanged: (val) => _validate(context),
                ),
                SizedBox(height: Dimensions.height10),
                CustomTextFormField(
                  controller: _foodPrice,
                  label: context.translate.foodCost,
                  hint: context.translate.foodCost,
                  textInputType: TextInputType.number,
                  onChanged: (val) => _validate(context),
                ),
                SizedBox(height: Dimensions.height30),
                CustomButton(
                  text: context.translate.add,
                  isEnabled: context.watch<AddFoodCubit>().isValid,
                  onClick: () => _addFood(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
