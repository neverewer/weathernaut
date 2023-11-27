import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:weathernaut/src/core/router/app_router.dart';
import 'package:weathernaut/src/features/app/themes.dart';
import 'package:weathernaut/src/features/dependencies/model/dependencies.dart';
import 'package:weathernaut/src/features/dependencies/widgets/dependencies_scope.dart';

class App extends StatelessWidget {
  final AppRouter router;
  final Dependencies dependencies;

  const App({
    super.key,
    required this.router,
    required this.dependencies,
  });

  @override
  Widget build(BuildContext context) {
    final routerConfig = router.config();

    return DependenciesScope(
      dependencies: dependencies,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        locale: Locale(Platform.localeName),
        theme: Themes.getTheme(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: routerConfig,
        // builder: (_, child) => Scaffold(
        //       body: DecoratedBox(
        //         decoration: const BoxDecoration(
        //           gradient: LinearGradient(
        //             colors: [
        //               Color(0xFFFEE3BC),
        //               Color(0XFFF39876),
        //             ],
        //             begin: Alignment.topLeft,
        //             end: Alignment.bottomRight,
        //           ),
        //         ),
        //         child: child,
        //       ),
        //     )
      ),
    );
  }
}
