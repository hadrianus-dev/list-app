import 'package:ListApp/src/shared/service/realm/models/task_model.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final TaskBoard board;
  const TaskCard({super.key, required this.board});

  double getProgress(List<Task> tasks) {
    final completes = tasks.where((task) => task.complete).length;
    return completes / tasks.length;
  }

  @override
  Widget build(BuildContext context) {
    final double progress = getProgress(board.tasks);
    const String progressText = '1/5';
    final String title = board.title;
    const String statusText = 'Pendente';
    final Color backgroundColor = Colors.blueAccent.withOpacity(0.5);
    const Color color = Colors.blueAccent;
    const iconData = Icons.access_alarm;

    return Container(
      height: 130,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(25)),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [Icon(iconData), Text(statusText)],
          ),
          const Spacer(),
          const Text('title'),
          LinearProgressIndicator(
            value: progress,
            color: color,
          ),
          const Text('1/5')
        ],
      ),
    );
  }
}
