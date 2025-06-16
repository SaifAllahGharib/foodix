import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/features/home/data/repos/main_buyer/main_buyer_repo.dart';

import '../../../../../data/models/restorant_model.dart';
import 'main_buyer_state.dart';

class MainBuyerCubit extends Cubit<MainBuyerState> {
  final MainBuyerRepo _mainBuyerRepo;

  MainBuyerCubit(this._mainBuyerRepo) : super(MainBuyerInit());

  void getRestaurants() async {
    emit(MainBuyerLoading());
    final result = await _mainBuyerRepo.getRestaurants();

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) emit(MainBuyerFailure(failure.errorMsg));
      },
      (snapshot) {
        if (!isClosed) {
          final data = snapshot.value as Map<dynamic, dynamic>;
          emit(MainBuyerSuccess(RestaurantModel.fromJsonMap(data)));
        }
      },
    );
  }
}
