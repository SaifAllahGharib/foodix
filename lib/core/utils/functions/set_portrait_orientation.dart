import 'package:flutter/services.dart';

void setPortraitOrientation() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
