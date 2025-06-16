import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/image_picker_helper.dart';
import 'package:foodix/features/add_food/data/repos/add_food_repo.dart';
import 'package:foodix/features/add_food/presentation/viewmodel/cubits/add_food/add_food_state.dart';

import '../../../../../../core/shared/models/food_model.dart';

class AddFoodCubit extends Cubit<AddFoodState> {
  final AddFoodRepository _addFoodRepository;
  final ImagePickerHelper _imagePickerHelper;
  bool _isValid = false;

  AddFoodCubit(this._addFoodRepository, this._imagePickerHelper)
    : super(AddFoodInit());

  Future<void> pickFromCamera() async {
    String? selectedImage = await _imagePickerHelper.pickFromCamera();
    emit(AddFoodPickImage(selectedImage));
  }

  Future<void> pickFromGallery() async {
    String? selectedImage = await _imagePickerHelper.pickFromGallery();
    emit(AddFoodPickImage(selectedImage));
  }

  void validation({
    required TextEditingController name,
    required TextEditingController desc,
    required TextEditingController price,
    required String? image,
  }) {
    _isValid =
        name.text.isNotEmpty &&
        desc.text.isNotEmpty &&
        price.text.isNotEmpty &&
        image != null;
    emit(AddFoodValidation(_isValid));
  }

  Future<void> addFood(String categoryName, FoodModel food) async {
    emit(AddFoodLoading());
    final result = await _addFoodRepository.addFood(categoryName, food);

    result.fold(
      (l) => emit(AddFoodFailure(l.errorMsg)),
      (r) => emit(AddFoodSuccess()),
    );
  }

  bool get isValid => _isValid;
}
