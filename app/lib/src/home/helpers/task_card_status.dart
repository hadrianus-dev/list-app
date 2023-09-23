import 'package:flutter/material.dart';

enum TaskCardStatus {
  pending(Icons.access_time, 'Pendente'),
  completed(Icons.check, 'Completo'),
  disabled(Icons.cancel_outlined, 'Desativado');

  final IconData icon;
  final String text;

  const TaskCardStatus(this.icon, this.text);
}
