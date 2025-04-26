
import 'package:flutter/material.dart';

class TaskInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) addTask;

  const TaskInputField({
    Key? key,
    required this.controller,
    required this.addTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              maxLength: 20, // Added a character limit of 20
              decoration: InputDecoration(
                labelText: 'Enter a task',
                labelStyle: const TextStyle(color: Colors.blue),
                border: const OutlineInputBorder(),
                errorText: controller.text.isEmpty
                    ? 'Task cannot be empty'
                    : (controller.text.length > 20
                        ? 'Task must be 20 characters or less'
                        : null),
              ),
              onChanged: (value) {
                // Trigger a rebuild for validation
                (context as Element).markNeedsBuild();
              },
            ),
          ),
          IconButton(
            onPressed: () {
              if (controller.text.isNotEmpty && controller.text.length <= 20) {
                addTask(controller.text);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter a valid task (20 characters max)'),
                  ),
                );
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}