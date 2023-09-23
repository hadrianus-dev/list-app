import 'package:ListApp/src/shared/service/realm/models/task_model.dart';
import 'package:flutter/material.dart';

import '../helpers/task_card_status.dart';

class TaskCard extends StatelessWidget {
  final TaskBoard board;
  const TaskCard({super.key, required this.board});

  double getProgress(List<Task> tasks) {
    final completes = tasks.where((task) => task.complete).length;
    return completes / tasks.length;
  }

  String getProgressText(List<Task> tasks) {
    final completes = tasks.where((task) => task.complete).length;
    return '$completes/{$tasks.length}';
  }

  TaskCardStatus getStatus(TaskBoard board, double progress) {
    if (!board.enable) {
      return TaskCardStatus.disabled;
    } else if (progress < 1.0) {
      return TaskCardStatus.pending;
    } else {
      return TaskCardStatus.completed;
    }
  }

  Color getBackgroundColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.primaryContainer;
      case TaskCardStatus.completed:
        return theme.colorScheme.tertiaryContainer;
      default: 
        return theme.colorScheme.errorContainer;
    }
  }
  Color getColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.primary;
      case TaskCardStatus.completed:
        return theme.colorScheme.tertiary;
      default: 
        return theme.colorScheme.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final double progress = getProgress(board.tasks);
    final String progressText = getProgressText(board.tasks);
    final String title = board.title;
    final TaskCardStatus status = getStatus(board, progress);
    final String statusText = status.text;
    final Color backgroundColor = getBackgroundColor(status, theme);
    final Color color = getColor(status, theme);
    final iconData = status.icon;

    return Container(
      height: 130,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(25)),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
