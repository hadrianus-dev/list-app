import 'package:ListApp/src/configuration/service/configuration_service_contract.dart';
import 'package:ListApp/src/shared/service/realm/models/configuration_model.dart';
import 'package:realm/realm.dart';

class ConfigurationService implements ConfigurationServiceContract {
  final Realm realm;
  ConfigurationService(this.realm);

  @override
  ConfigurationModel getConfiguration() {
    return realm.all<ConfigurationModel>().first;
  }

  @override
  void saveConfiguration(String themeModeName, DateTime? syncDate) {
    final model = getConfiguration();
    realm.write(() {
      model.themeModeName = themeModeName;
      model.syncDate = syncDate;
    });
  }

  @override
  void deleteAll() {
    // TODO: implement deleteAll
  }
}
