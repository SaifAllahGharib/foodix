import '../../../../../../core/shared/models/user_model.dart';

sealed class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final UserModel user;

  HomeSuccessState(this.user);
}

class HomeFailureState extends HomeState {
  final String errorMsg;

  HomeFailureState(this.errorMsg);
}

class HomeChangeViewState extends HomeState {
  final int selectedIndex;

  HomeChangeViewState(this.selectedIndex);
}
