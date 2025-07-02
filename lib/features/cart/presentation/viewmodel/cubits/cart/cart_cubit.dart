import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/features/cart/presentation/viewmodel/cubits/cart/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final int _initCount = 1;

  CartCubit() : super(const CartState());

  void incrementCountOfProducts(int index) {
    final updated = Map<int, int>.from(state.countMap);
    updated[index] = (updated[index] ?? _initCount) + 1;

    emit(state.copyWith(countMap: updated));
  }

  void decrementCountOfProducts(int index) {
    final updated = Map<int, int>.from(state.countMap);
    if ((updated[index] ?? _initCount) > _initCount) {
      updated[index] = updated[index]! - 1;
      emit(state.copyWith(countMap: updated));
    }
  }

  int countOfProducts(int index) {
    return state.countMap[index] ?? _initCount;
  }
}
