import '../../shared/service/realm/models/configuration_model.dart';

abstract class ConfigurationServiceContract {
  ConfigurationModel getConfiguration();
  void saveConfiguration(String themeModeName, DateTime? syncDate);
  void deleteAll();
}
