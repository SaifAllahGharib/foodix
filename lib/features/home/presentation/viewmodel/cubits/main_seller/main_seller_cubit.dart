import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/features/home/data/repos/main_seller/main_seller_repo.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/main_seller/main_seller_state.dart';

import '../../../../../../core/shared/models/category_model.dart';

class MainSellerCubit extends Cubit<MainSellerState> {
  final MainSellerRepository _mainSellerRepository;
  bool _isEnabled = false;
  StreamSubscription? _categorySubscription;

  MainSellerCubit(this._mainSellerRepository) : super(MainSellerInit());

  @override
  Future<void> close() {
    _categorySubscription?.cancel();
    return super.close();
  }

  Future<void> addCategory(CategoryModel category) async {
    emit(MainSellerLoading());
    final result = await _mainSellerRepository.addCategory(category);

    result.fold(
      (l) => emit(MainSellerFailure(l.errorMsg)),
      (r) => emit(MainSellerAddCategory()),
    );
  }

  Future<void> getCategories() async {
    emit(MainSellerLoading());
    _categorySubscription?.cancel();

    _categorySubscription = _mainSellerRepository.getCategories().listen((
      result,
    ) {
      if (isClosed) return;
      result.fold(
        (l) => emit(MainSellerFailure(l.errorMsg)),
        (snapshot) => emit(MainSellerGetCategory(snapshot)),
      );
    });
  }

  void enableButton(TextEditingController controller) {
    _isEnabled = controller.text.isNotEmpty;
    emit(MainSellerEnableButton());
  }

  bool get isEnabled => _isEnabled;
}
