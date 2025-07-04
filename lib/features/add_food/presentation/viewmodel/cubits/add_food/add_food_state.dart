import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/shared/page_state.dart';

part 'add_food_state.freezed.dart';

@freezed
sealed class AddFoodState with _$AddFoodState {
  const factory AddFoodState({
    @Default(PageState.init()) PageState status,
    String? pickedImage,
    @Default(false) bool isValid,
  }) = _AddFoodState;
}
