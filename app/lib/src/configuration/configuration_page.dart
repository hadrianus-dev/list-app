import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/stores/app_store.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    final appStore = context.watch<AppStore>(
      (store) => store.themeMode,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('LISTINHA'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configuracoes',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Tema',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: appStore.themeMode.value,
              title: Text(
                'Sistema',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              onChanged: (mode) {
                appStore.themeMode.value = mode!;
              },
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: appStore.themeMode.value,
              title: Text(
                'Claro',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              onChanged: (mode) {
                appStore.themeMode.value = mode!;
              },
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: appStore.themeMode.value,
              title: Text(
                'Escuro',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              onChanged: (mode) {
                appStore.themeMode.value = mode!;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Controle de Dados',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
                onPressed: () {},
                child: const Text('Apagar Cache e Reiniciar o App')),
          ],
        ),
      ),
    );
  }
}
