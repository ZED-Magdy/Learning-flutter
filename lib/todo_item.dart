import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String task;
  final void Function(String task) removeTask;
  final void Function(String task) markTaskAsDone;

  const TodoItem({
    super.key,
    required this.task,
    required this.removeTask,
    required this.markTaskAsDone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(task),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 5,
                  left: 5,
                ),
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.green),
                  ),
                  onPressed: () {},
                  child: const Text('Done'),
                ),
              ),
              FilledButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.red),
                ),
                onPressed: () => removeTask(task),
                child: const Text('Delete'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
