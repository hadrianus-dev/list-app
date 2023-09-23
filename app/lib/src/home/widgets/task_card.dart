// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ListApp/src/shared/service/realm/models/task_model.dart';
import 'package:flutter/material.dart';

import '../helpers/task_card_status.dart';

class TaskCard extends StatelessWidget {
  final TaskBoard board;
  final double? height;
  const TaskCard({
    Key? key,
    required this.board, this.height,
  }) : super(key: key);

  double getProgress(List<Task> tasks) {
    if (tasks.isEmpty) return 0;
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
      height: height,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(25)),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(iconData, color: theme.iconTheme.color?.withOpacity(0.5)),
              Text(
                statusText,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
                ),
              )
            ],
          ),
          const Spacer(),
          Text(
            'title',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          if (board.tasks.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  color: color,
                ),
              ],
            ),
          const SizedBox(height: 3),
          const Text('1/5')
        ],
      ),
    );
  }
}
