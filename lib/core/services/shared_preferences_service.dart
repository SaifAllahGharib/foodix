import 'package:flutter/material.dart';
import 'package:foodix/core/di/dependency_injection.dart';
import 'package:foodix/core/utils/roles.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final Logger _logger;
  late final SharedPreferences _prefs;

  SharedPreferencesService(this._logger);

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? getLanguageCode() {
    return _prefs.getString('languageCode');
  }

  Future<void> setLanguageCode(String code) async {
    await _prefs.setString('languageCode', code);
  }

  Future<void> saveInitialLocaleIfNotSet(Locale deviceLocale) async {
    final alreadySet = _prefs.containsKey('languageCode');
    if (!alreadySet) {
      await setLanguageCode(deviceLocale.languageCode);
    }
  }

  Future<void> storeUser(Map<String, dynamic> user) async {
    for (var entry in user.entries) {
      await storeString(entry.key, entry.value.toString());
    }
  }

  String? getIdUser() => getString("uid");

  String? getNameUser() => getString('name');

  String? getEmailUser() => getString('email');

  String? getPhoneUser() => getString('phone');

  UserRole? getRoleUser() => getString('role') == getIt<Seller>().toString()
      ? getIt<Seller>()
      : getIt<Buyer>();

  Future<bool> storeString(String key, String value) async {
    return await _safeWrite(
      () => _prefs.setString(key, value),
      'Error storing string',
    );
  }

  String? getString(String key) => _prefs.getString(key);

  Future<bool> clearAllData() async {
    return await _safeWrite(() => _prefs.clear(), 'Error clearing data');
  }

  Future<bool> _safeWrite(
    Future<bool> Function() operation,
    String errorMessage,
  ) async {
    try {
      return await operation();
    } catch (e, stacktrace) {
      _logger.e(errorMessage, error: e, stackTrace: stacktrace);
      return false;
    }
  }
}
