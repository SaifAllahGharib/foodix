import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_route_name.dart';
import 'core/routing/app_router.dart';
import 'core/shared/functions/init_app.dart';
import 'core/shared/viewmodel/cubits/locale_cubit.dart';
import 'core/theme/app_theme.dart';
import 'generated/l10n.dart';

void main() async {
  await initializeApp();

  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LocaleCubit>(),
      child: BlocSelector<LocaleCubit, Locale, Locale>(
        selector: (locale) => locale,
        builder: (context, locale) {
          return MaterialApp(
            locale: locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: AppTheme.light(context),
            supportedLocales: S.delegate.supportedLocales,
            initialRoute: AppRouteName.chooseLanguage,
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}
