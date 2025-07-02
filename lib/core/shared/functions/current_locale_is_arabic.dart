import 'package:foodix/core/di/dependency_injection.dart';
import 'package:foodix/core/services/shared_preferences_service.dart';

bool get currentLocaleIsArabic =>
    getIt<SharedPreferencesService>().getLanguageCode() == "ar";
