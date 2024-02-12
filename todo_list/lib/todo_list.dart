import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task {
  Task({required this.taskName, required this.isTaskDone});

  final String taskName;
  final bool isTaskDone;
}

class TodoListContainer extends StatefulWidget {
  const TodoListContainer({super.key});

  @override
  State<TodoListContainer> createState() => _TodoListContainerState();
}

class _TodoListContainerState extends State<TodoListContainer> {
  final List<Task> tasks = [];

  void _addTask(String taskName) {
    setState(() {
      tasks.add(Task(taskName: taskName, isTaskDone: false));
    });
  }

  void _removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _updateTask(int index) {
    setState(() {
      Task currentTask = tasks[index];

      Task newTask = Task(
          taskName: currentTask.taskName, isTaskDone: !currentTask.isTaskDone);

      tasks.removeAt(index);
      tasks.insert(index, newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TodoList(
      tasks: tasks,
      onNewTask: (taskName) {
        _addTask(taskName);
      },
      removeTask: (taskIndex) {
        _removeTask(taskIndex);
      },
      updateTask: (taskIndex) {
        _updateTask(taskIndex);
      },
    );
  }
}

class TodoList extends StatelessWidget {
  TodoList({
    super.key,
    required this.onNewTask,
    required this.tasks,
    required this.removeTask,
    required this.updateTask,
  });

  final TextEditingController _textEditingController = TextEditingController();
  final Function(String taskName) onNewTask;
  final List<Task> tasks;
  final Function(int taskIndex) removeTask;
  final Function(int taskIndex) updateTask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
        backgroundColor: Colors.black87,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            SizedBox(
              height: 300,
              child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return TodoItem(
                      task: tasks[index],
                      onLongPressed: () {
                        removeTask(index);
                      },
                      onPressed: () {
                        updateTask(index);
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (_textEditingController.text.isNotEmpty) {
                onNewTask(_textEditingController.text);
              }
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.task,
    required this.onLongPressed,
    required this.onPressed,
  });

  final Task task;
  final Function() onLongPressed;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    Icon? isItemDone;

    if (task.isTaskDone) {
      isItemDone = const Icon(Icons.done_all);
    } else {
      isItemDone = null;
    }

    return ListTile(
      title: Text(task.taskName),
      onLongPress: onLongPressed,
      onTap: onPressed,
      trailing: isItemDone,
    );
  }
}
