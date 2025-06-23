import 'package:flutter/cupertino.dart';
import 'package:foodix/generated/l10n.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtensions on BuildContext {
  S get translate => S.of(this);

  GoRouterState get goRouterState => GoRouterState.of(this);
}
