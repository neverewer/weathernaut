import 'dart:io';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:weathernaut/import.dart';
import 'package:weathernaut/src/core/router/app_router.dart';

class App extends StatelessWidget {
  final AppRouter router;

  const App({
    super.key,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    final routerConfig = router.config();

    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        locale: Locale(Platform.localeName),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: routerConfig);
  }
}
