import 'package:ListApp/src/home/widgets/custom_drawer.dart';
import 'package:ListApp/src/home/widgets/task_card.dart';
import 'package:ListApp/src/shared/service/realm/models/task_model.dart';
import 'package:ListApp/src/shared/widgets/user_image_button.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

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
              padding: const EdgeInsets.only(
                  top: 65, left: 30, right: 30, bottom: 200),
              itemCount: 100,
              itemBuilder: (_, index) {
                final board =
                    TaskBoard(Uuid.v4(), 'Nova Lista de Tarefas 1', tasks: [
                  Task(Uuid.v4(), '', complete: true),
                  Task(Uuid.v4(), '', complete: true),
                  Task(Uuid.v4(), ''),
                  Task(Uuid.v4(), '')
                ]);
                return TaskCard(board: board, height: 140);
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
