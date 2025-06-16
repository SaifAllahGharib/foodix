

sealed class AddFoodState {}

class AddFoodInit extends AddFoodState {}

class AddFoodLoading extends AddFoodState {}

class AddFoodSuccess extends AddFoodState {}

class AddFoodFailure extends AddFoodState {
  final String errorMsg;

  AddFoodFailure(this.errorMsg);
}

class AddFoodPickImage extends AddFoodState {
  final String? image;

  AddFoodPickImage(this.image);
}

class AddFoodValidation extends AddFoodState {
  final bool isValid;

  AddFoodValidation(this.isValid);
}
