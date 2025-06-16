import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/functions/snack_bar.dart';
import 'package:foodix/core/widgets/custom_back_button.dart';
import 'package:foodix/core/widgets/custom_button.dart';
import 'package:foodix/core/widgets/custom_text.dart';
import 'package:foodix/core/widgets/custom_text_field.dart';
import 'package:foodix/core/widgets/loading.dart';
import 'package:foodix/features/add_food/presentation/view/widgets/custom_button_image_picker.dart';
import 'package:foodix/features/add_food/presentation/viewmodel/cubits/add_food/add_food_cubit.dart';
import 'package:foodix/features/add_food/presentation/viewmodel/cubits/add_food/add_food_state.dart';
import 'package:foodix/generated/l10n.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/shared/models/food_model.dart';

class AddFoodViewBody extends StatefulWidget {
  final String categoryName;

  const AddFoodViewBody({super.key, required this.categoryName});

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

  void validate(BuildContext context) {
    context.read<AddFoodCubit>().validation(
      name: _foodName,
      desc: _foodDesc,
      price: _foodPrice,
      image: _imagePath,
    );
  }

  void _pickImageFromCamera(BuildContext context) {
    GoRouter.of(context).pop();
    context.read<AddFoodCubit>().pickFromCamera();
  }

  void _pickImageFromGallery(BuildContext context) {
    GoRouter.of(context).pop();
    context.read<AddFoodCubit>().pickFromGallery();
  }

  void _addFood(BuildContext context) {
    context.read<AddFoodCubit>().addFood(
      widget.categoryName,
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
    } else if (state is AddFoodSuccess) {
      snackBar(
        context: context,
        text: S.of(context).success,
        color: AppColors.primaryColor,
      );

      GoRouter.of(context).pop();
    } else if (state is AddFoodFailure) {
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
                CustomText(text: S.of(context).addFood),
                SizedBox(height: Dimensions.height45),
                CustomButtonImagePicker(
                  pickImageFromCamera: () => _pickImageFromCamera(context),
                  pickImageFromGallery: () => _pickImageFromGallery(context),
                  selectedImage: _imagePath,
                ),
                SizedBox(height: Dimensions.height20),
                CustomTextField(
                  controller: _foodName,
                  hint: S.of(context).foodName,
                  onChanged: (val) => validate(context),
                ),
                SizedBox(height: Dimensions.height10),
                CustomTextField(
                  controller: _foodDesc,
                  hint: S.of(context).foodDesc,
                  onChanged: (val) => validate(context),
                ),
                SizedBox(height: Dimensions.height10),
                CustomTextField(
                  controller: _foodPrice,
                  hint: S.of(context).foodCost,
                  textInputType: TextInputType.number,
                  onChanged: (val) => validate(context),
                ),
                SizedBox(height: Dimensions.height30),
                CustomButton(
                  text: S.of(context).add,
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
