import 'package:ListApp/src/app.dart';
import 'package:ListApp/src/app_module.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}
