import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/shared/page_state.dart';

part 'cart_state.freezed.dart';

@freezed
sealed class CartState with _$CartState {
  const factory CartState({
    @Default(PageState.init()) PageState status,
    @Default({}) Map<int, int> countMap,
  }) = _CartState;
}
