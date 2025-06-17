import 'package:flutter/cupertino.dart';
import 'package:foodix/generated/l10n.dart';

extension Translator on BuildContext {
  S get translate => S.of(this);
}
