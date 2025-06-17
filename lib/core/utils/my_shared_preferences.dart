import 'package:foodix/core/utils/di.dart';
import 'package:foodix/core/utils/roles.dart';
import 'package:foodix/features/home/presentation/view/home_view.dart';
import 'package:foodix/features/login/presentation/view/login_view.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  MySharedPreferences._internal();

  static final MySharedPreferences _instance = MySharedPreferences._internal();

  factory MySharedPreferences() => _instance;

  final Logger _logger = Logger();
  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> storeUser(Map<String, dynamic> user) async {
    final futures = <Future>[];

    for (var entry in user.entries) {
      futures.add(storeString(entry.key, entry.value.toString()));
    }

    await Future.wait(futures);
  }

  String? getIdUser() => getString('uid');

  String? getNameUser() => getString('name');

  String? getEmailUser() => getString('email');

  String? getPhoneUser() => getString('phone');

  UserRole? getRoleUser() {
    if (getString('role') == getIt<Seller>().toString()) {
      return getIt<Seller>();
    } else if (getString('role') == getIt<Buyer>().toString()) {
      return getIt<Buyer>();
    }
    return null;
  }

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

  String getInitRoute() {
    final lang = getString('lang');
    final id = getIdUser();
    if (lang == null) return '/';
    return id == null ? LoginView.id : HomeView.id;
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
