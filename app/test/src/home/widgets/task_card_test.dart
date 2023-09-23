import 'package:ListApp/src/home/widgets/task_card.dart';
import 'package:ListApp/src/shared/service/realm/models/task_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:realm/realm.dart';

void main() {
  final board = TaskBoard(Uuid.v4(), 'Nova Lista');
  test('getProgress', () {
    final tasks = [
      Task(Uuid.v4(), '', complete: true),
      Task(Uuid.v4(), '', complete: true),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), '')
    ];

    final progress = TaskCard(board: board).getProgress(tasks);

    expect(progress, 0.5);
  });
}
