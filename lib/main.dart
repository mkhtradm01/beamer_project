import 'package:beamer/beamer.dart';
import 'package:beamer_project/router.beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: PlatformProvider(
        builder: (context) => BeamerProvider(
          routerDelegate: routerDelegate,
          child: PlatformApp.router(
            key: globalScaffoldKey,
            material: (context, platform) =>
                MaterialAppRouterData(theme: ThemeData.light(), darkTheme: ThemeData.dark()),
            routerDelegate: routerDelegate,
            routeInformationParser: BeamerParser(),
            backButtonDispatcher: BeamerBackButtonDispatcher(
              delegate: routerDelegate,
            ),
          ),
        ),
      ),
    );
  }
}
