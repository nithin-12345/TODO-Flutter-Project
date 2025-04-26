
import 'package:flutter/material.dart';

class TaskListView extends StatelessWidget {
  final List<String> tasks;
  final Function(int) removeTask;

  const TaskListView({
    Key? key,
    required this.tasks,
    required this.removeTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Padding(
        
          padding: const EdgeInsets.all(10),
          child: ListTile(
            tileColor: Colors.grey[200],
            
            title: Text(tasks[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => removeTask(index),
            ),
          ),
        );
      },
    );
  }
}




