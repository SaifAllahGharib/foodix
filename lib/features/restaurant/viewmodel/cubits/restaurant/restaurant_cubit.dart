import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/features/restaurant/viewmodel/cubits/restaurant/restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  double _appBarHeight = 0.0;
  double _opacity = 0.0;
  final Map<int, int> _countOfProducts = {};
  final int initCount = 1;

  RestaurantCubit() : super(RestaurantInitState());

  void showCategoryTabBar(double offSet) {
    _appBarHeight = offSet;
    emit(RestaurantShowCategoryListViewState(_appBarHeight));
  }

  void updateOpacity(double value) {
    _opacity = value;
    emit(RestaurantUpdateOpacityState(_opacity));
  }

  void incrementCountOfProduct(int index) {
    _countOfProducts[index] = ((_countOfProducts[index] ?? initCount) + 1);
    emit(RestaurantCounterState());
  }

  void decrementCountOfProduct(int index) {
    if ((_countOfProducts[index] ?? initCount) > initCount) {
      _countOfProducts[index] = ((_countOfProducts[index] ?? initCount) - 1);
      emit(RestaurantCounterState());
    }
  }

  int countOfProducts(int index) => _countOfProducts[index] ?? initCount;
}
