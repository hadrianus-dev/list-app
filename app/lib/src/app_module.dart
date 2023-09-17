import 'package:ListApp/src/configuration/configuration_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ListApp/src/home/home_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module('/home', module: HomeModule());
    r.child('/config', child: (context) => const ConfigurationPage());
  }
}
