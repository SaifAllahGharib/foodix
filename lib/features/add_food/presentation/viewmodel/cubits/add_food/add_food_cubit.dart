import 'package:flutter/cupertino.dart';  
import 'package:flutter_bloc/flutter_bloc.dart';  
import 'package:foodix/core/shared/page_state.dart';  
import 'package:foodix/core/utils/image_picker_helper.dart';  
import 'package:foodix/features/add_food/data/repos/add_food_repo.dart';  
import 'package:foodix/features/add_food/presentation/viewmodel/cubits/add_food/add_food_state.dart';  

import '../../../../../../core/shared/models/food_model.dart';  

class AddFoodCubit extends Cubit<AddFoodState> {
  final AddFoodRepository _addFoodRepository;
  final ImagePickerHelper _imagePickerHelper;

  AddFoodCubit(this._addFoodRepository, this._imagePickerHelper)
    : super(const AddFoodState());

  Future<void> pickFromCamera() async {
    String? selectedImage = await _imagePickerHelper.pickFromCamera();
    emit(state.copyWith(pickedImage: selectedImage));
  }

  Future<void> pickFromGallery() async {
    String? selectedImage = await _imagePickerHelper.pickFromGallery();
    emit(state.copyWith(pickedImage: selectedImage));
  }

  void validation({
    required TextEditingController name,
    required TextEditingController desc,
    required TextEditingController price,
    required String? image,
  }) {
    bool isValid =
        name.text.isNotEmpty &&
        desc.text.isNotEmpty &&
        price.text.isNotEmpty &&
        image != null;
    emit(state.copyWith(isValid: isValid));
  }

  Future<void> addFood(String categoryName, FoodModel food) async {
    emit(state.copyWith(status: const PageState.loading()));
    final result = await _addFoodRepository.addFood(categoryName, food);

    result.when(
      failure: (failure) =>
          emit(state.copyWith(status: PageState.failure(failure.message!))),
      success: (_) => emit(state.copyWith(status: const PageState.success())),
    );
  }
}
