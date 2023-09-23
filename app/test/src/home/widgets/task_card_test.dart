import 'package:ListApp/src/home/helpers/task_card_status.dart';
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
  test('Ensure getStatus return TaskCardStatus.disabled when TaskBoard.enable is false', () {
    final board = TaskBoard(Uuid.v4(), 'Nova Lista', enable: false);
    final tasks = [
      Task(Uuid.v4(), '', complete: true),
      Task(Uuid.v4(), '', complete: true),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), '')
    ];

    final progress = TaskCard(board: board).getProgress(tasks);
    final status = TaskCard(board: board).getStatus(board, progress);

    expect(status, TaskCardStatus.disabled);
  });
  test('Ensure getStatus return TaskCardStatus.pending when progress is < 1.0', () {
    final tasks = [
      Task(Uuid.v4(), '', complete: true),
      Task(Uuid.v4(), '', complete: true),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), '')
    ];

    final progress = TaskCard(board: board).getProgress(tasks);
    final status = TaskCard(board: board).getStatus(board, progress);

    expect(status, TaskCardStatus.pending);
  });
  test('Ensure getStatus return TaskCardStatus.completed when progress is = 1.0', () {
    final tasks = [
      Task(Uuid.v4(), '', complete: true),
      Task(Uuid.v4(), '', complete: true),
      Task(Uuid.v4(), '', complete: true),
      Task(Uuid.v4(), '', complete: true)
    ];

    final progress = TaskCard(board: board).getProgress(tasks);
    final status = TaskCard(board: board).getStatus(board, progress);

    expect(status, TaskCardStatus.completed);
  });
}
