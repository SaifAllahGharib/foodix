import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/features/cart/presentation/viewmodel/cubits/cart/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final Map<int, int> _countOfProducts = {};
  final int initCount = 1;

  CartCubit() : super(CartInitState());

  void incrementCountOfProducts(int index) {
    _countOfProducts[index] = (_countOfProducts[index] ?? initCount) + 1;
    emit(CartCounterState());
  }

  void decrementCountOfProducts(int index) {
    if ((_countOfProducts[index] ?? initCount) > initCount) {
      _countOfProducts[index] = _countOfProducts[index]! - 1;
      emit(CartCounterState());
    }
  }

  int countOfProducts(int index) => _countOfProducts[index] ?? initCount;
}
