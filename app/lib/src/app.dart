import 'package:ListApp/src/configuration/service/configuration_service.dart';
import 'package:ListApp/src/shared/stores/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ListApp/src/shared/themes/themes.dart';
import 'package:rx_notifier/rx_notifier.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final config = Modular.get<ConfigurationService>();
  final appStore = Modular.get<AppStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/home/');
    final themeMode = context.select(() => appStore.themeMode.value);
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
