import 'package:ListApp/src/shared/stores/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:rx_notifier/rx_notifier.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final appStore = context.read<AppStore>();

    final syncDate = context.select(() => appStore.syncDate.value);
    var sysncDateText = 'Nunca ';

    if (syncDate != null) {
      final format = DateFormat('dd/MM/yyyy às hh:mm');
      sysncDateText = format.format(syncDate);
    }

    return NavigationDrawer(
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed('/config');
          }
        },
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 28, right: 16, left: 16, bottom: 16),
            child: Text(
              'Opções',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          NavigationDrawerDestination(
              icon: const Icon(Icons.sync),
              label: SizedBox(
                width: 210,
                child: Row(
                  children: [
                    const Text('Sincronizar'),
                    const SizedBox(
                      width: 28,
                    ),
                    Text(
                      sysncDateText,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              )),
          const NavigationDrawerDestination(
              icon: Icon(Icons.settings), label: Text('Configurações'))
        ]);
  }
}
