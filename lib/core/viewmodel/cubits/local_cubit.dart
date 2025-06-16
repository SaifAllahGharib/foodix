import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/my_shared_preferences.dart';

class LocalCubit extends Cubit<Locale> {
  bool _isArabic = false;

  LocalCubit() : super(const Locale("ar")) {
    _setDirection("ar");
  }

  Future<void> loadSavedLanguage() async {
    var prefs = MySharedPreferences();

    final String? savedLanguage = prefs.getString("lang");
    if (savedLanguage != null) {
      _setDirection(savedLanguage);
      emit(Locale(savedLanguage));
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    var prefs = MySharedPreferences();
    await prefs.storeString("lang", languageCode);
    _setDirection(languageCode);
    emit(Locale(languageCode));
  }

  void _setDirection(String languageCode) {
    _isArabic = languageCode == "ar";
  }
  
  bool get isArabic => _isArabic;
}
