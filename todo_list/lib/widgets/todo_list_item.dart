import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../models/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    Key? key,
    required this.todo,
    required this.onDelete,
  }) : super(key: key);

  // Dado do To do
  final Todo todo;
  // Faz com que o widget pai consiga remover o widget filho, fazendo com que remova pelo To do
  final Function(Todo) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        actionExtentRatio: 0.25,
        actionPane: const SlidableDrawerActionPane(),
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              onDelete(todo);
            },
          ),
        ],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey[200],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat('dd/MM/yyyy - HH:mm').format(todo.dateTime),
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                todo.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
