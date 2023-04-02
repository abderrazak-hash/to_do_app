import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/controllers/tasks_controllers.dart';
import 'package:todo_app/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: 400.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _textEditingController,
            focusNode: _focusNode,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              hintText: 'Add a task',
              suffixIcon: Icon(Icons.flag),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Consumer<TasksController>(
            builder: (context, tasksController, child) => IconButton(
              icon: Icon(
                Icons.keyboard_double_arrow_right_rounded,
                color: purple,
              ),
              onPressed: () {
                tasksController.addTask(
                  Task(
                    title: _textEditingController.value.text,
                    // id: tasksController.tasks.length,
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
