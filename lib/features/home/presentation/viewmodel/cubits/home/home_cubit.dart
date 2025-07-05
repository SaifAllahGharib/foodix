import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/features/home/data/repos/home/home_repo.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/home/home_state.dart';

import '../../../../../../core/shared/models/user_model.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;
  int _selectedIndex = 0;

  HomeCubit(this._homeRepository) : super(HomeInitState()) {
    HomeChangeViewState(0);
  }

  void changeTab(int index) {
    _selectedIndex = index;
    emit(HomeChangeViewState(_selectedIndex));
  }

  void resetState() {
    _selectedIndex = 0;
    emit(HomeChangeViewState(_selectedIndex));
  }

  Future<void> getUser() async {
    emit(HomeLoadingState());
    final result = await _homeRepository.getUser();

    result.when(
      failure: (e) => emit(HomeFailureState(e.message!)),
      success: (user) {
        print(user.value);
        emit(HomeSuccessState(UserModel.fromJson(user.value as Map)));
      },
    );
  }

  int get selectedIndex => _selectedIndex;
}
