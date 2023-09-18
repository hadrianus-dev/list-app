import 'package:flutter/material.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
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
              groupValue: ThemeMode.system,
              title: Text(
                'Sistema',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              onChanged: null,
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: ThemeMode.light,
              title: Text(
                'Claro',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              onChanged: null,
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: ThemeMode.dark,
              title: Text(
                'Escuro',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              onChanged: null,
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
