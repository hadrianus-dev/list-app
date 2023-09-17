import 'package:ListApp/src/home/edit_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ListApp/src/home/home_page.dart';

class HomeModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/edit', child: (context) => const EditPage());
  }
}
