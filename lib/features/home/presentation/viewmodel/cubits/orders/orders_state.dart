sealed class OrdersState {}

class OrdersInitState extends OrdersState {}

class OrdersLoadingState extends OrdersState {}

class OrdersSuccessState extends OrdersState {}

class OrdersFailureState extends OrdersState {}

class OrdersUpdateSelectedDayState extends OrdersState {
  final int selectedIndex;

  OrdersUpdateSelectedDayState(this.selectedIndex);
}
