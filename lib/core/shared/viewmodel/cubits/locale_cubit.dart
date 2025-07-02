import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/shared_preferences_service.dart';

class LocaleCubit extends Cubit<Locale> {
  final SharedPreferencesService _prefs;

  LocaleCubit(this._prefs) : super(Locale(_prefs.getLanguageCode() ?? 'ar'));

  void setLocale(String languageCode) async {
    if (languageCode != state.languageCode) {
      await _prefs.setLanguageCode(languageCode);
      emit(Locale(languageCode));
    }
  }
}
