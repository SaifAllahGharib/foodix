import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../../firebase_options.dart';
import '../../di/dependency_injection.dart';
import '../../services/shared_preferences_service.dart';
import 'set_portrait_orientation.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPortraitOrientation();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupDependencyInjection();
  await getIt<SharedPreferencesService>().init();

  await getIt<SharedPreferencesService>().saveInitialLocaleIfNotSet(
    WidgetsBinding.instance.platformDispatcher.locale,
  );
}
