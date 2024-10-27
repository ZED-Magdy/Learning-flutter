import 'package:flutter/material.dart';
import 'package:todoapp/todo_item.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> tasks = [];
  TextEditingController controller = TextEditingController();

  void removeTask(String task) {
    setState(() {
      tasks.remove(task);
    });
  }

  void removeAllTasks() {
    setState(() {
      tasks.clear();
    });
  }

  void markTaskAsDone(String task) {
    setState(() {
      tasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.brown[400],
      ),
      body: Container(
          color: Colors.brown[100],
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FilledButton(
                  onPressed: removeAllTasks,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red),
                  ),
                  child: const Text('Clear All'),
                ),
                TextField(
                  controller: controller,
                  onSubmitted: (value) => {
                    setState(() {
                      tasks.add(value);
                    }),
                    controller.clear(),
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your task',
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      var item = tasks[index];
                      return TodoItem(
                        task: item,
                        removeTask: removeTask,
                        markTaskAsDone: markTaskAsDone,
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
