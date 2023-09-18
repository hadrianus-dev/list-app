import 'package:flutter/material.dart';

class AppStore {
  final themeMode = ValueNotifier(ThemeMode.system);
  final syncDate = ValueNotifier<DateTime?>(null);

  AppStore();

  void init() {}
  void save() {}

  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
    }
  }

  void setSyncDate(DateTime date) {
    syncDate.value = date;
    save();
  }
}
