import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/orders/orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  int _selectedIndex = 0;

  OrdersCubit() : super(OrdersInitState());

  void selectDayTab(int index) {
    _selectedIndex = index;
    emit(OrdersUpdateSelectedDayState(_selectedIndex));
  }
}
