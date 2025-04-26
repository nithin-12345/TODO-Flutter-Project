
import 'package:assignment/Components/listViewComponent.dart';
import 'package:assignment/Components/textFieldComponent.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<String> _tasks = [];
  final TextEditingController _textController = TextEditingController();

  void _addTask(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _tasks.add(task);
      });
      _textController.clear();
    }
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Center(child: Text('To-Do List')),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth > 600
              ? Column(
                
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: SizedBox(
                          width: 500,
                          child: TaskInputField(
                            controller: _textController,
                            addTask: _addTask,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: 500,
                        child: TaskListView(
                          tasks: _tasks,
                          removeTask: _removeTask,
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    TaskInputField(
                      controller: _textController,
                      addTask: _addTask,
                    ),
                    Expanded(
                      child: TaskListView(
                        tasks: _tasks,
                        removeTask: _removeTask,
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}








