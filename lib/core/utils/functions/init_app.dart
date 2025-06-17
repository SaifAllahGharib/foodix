import 'package:firebase_core/firebase_core.dart';
import 'package:foodix/core/utils/di.dart';
import 'package:foodix/core/utils/my_shared_preferences.dart';
import 'package:foodix/firebase_options.dart';

Future<void> initializeApp() async {
  await Future.wait([
    MySharedPreferences().init(),
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
  ]);

  setupServiceLocator();
}
