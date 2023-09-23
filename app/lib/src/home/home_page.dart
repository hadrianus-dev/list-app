import 'package:ListApp/src/home/widgets/custom_drawer.dart';
import 'package:ListApp/src/home/widgets/task_card.dart';
import 'package:ListApp/src/shared/widgets/user_image_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('LISTINHA'),
        actions: const [
          Padding(padding: EdgeInsets.only(right: 8), child: UserImageButton())
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            ListView.separated(
              itemCount: 100,
              itemBuilder: (_, index) {
                return const TaskCard();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SegmentedButton<int>(
                  segments: const [
                    ButtonSegment(value: 0, label: Text('Todos')),
                    ButtonSegment(value: 1, label: Text('Pendetes')),
                    ButtonSegment(value: 2, label: Text('Concluidos')),
                    ButtonSegment(value: 3, label: Text('Desativados')),
                  ],
                  selected: const {0},
                  onSelectionChanged: (values) {},
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton.extended(
        onPressed: null,
        label: Text('Nova Lista'),
        icon: Icon(Icons.edit),
      ),
    );
  }
}
