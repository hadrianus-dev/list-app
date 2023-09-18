import 'package:ListApp/src/configuration/configuration_page.dart';
import 'package:ListApp/src/configuration/service/configuration_service.dart';
import 'package:ListApp/src/configuration/service/configuration_service_contract.dart';
import 'package:ListApp/src/shared/service/realm/realm_config.dart';
import 'package:ListApp/src/shared/stores/app_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ListApp/src/home/home_module.dart';
import 'package:realm/realm.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addInstance<Realm>(Realm(config));
    i.add<ConfigurationServiceContract>(ConfigurationService.new);
    i.addSingleton(AppStore.new);
  }

  @override
  void routes(r) {
    r.module('/home', module: HomeModule());
    r.child('/config', child: (context) => const ConfigurationPage());
  }
}
