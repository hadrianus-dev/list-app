import 'package:ListApp/src/app.dart';
import 'package:ListApp/src/app_module.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

void main() {
  RxRoot(child: ModularApp(module: AppModule(), child: const MyApp()));
}
