import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/controllers/tasks_controllers.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/delete_task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksController>(
      builder: (context, tasksController, child) => Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              offset: Offset(-2, 2),
              blurRadius: 10.0,
              spreadRadius: 0.0,
              color: Color(0x448993C9),
            ),
            BoxShadow(
              offset: Offset(2, -2),
              blurRadius: 10.0,
              spreadRadius: 0.0,
              color: Color(0x448993C9),
            ),
          ],
        ),
        child: Row(
          children: [
            Text(
              task.title,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => DeleteTaskDialog(task: task),
                );
              },
              child: Container(
                height: 11,
                width: 27.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {
                tasksController.doTask(task);
              },
              child: Container(
                width: 23,
                height: 23,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: task.isDone ? yellow : Colors.transparent,
                  border: Border.all(
                    color: yellow,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
