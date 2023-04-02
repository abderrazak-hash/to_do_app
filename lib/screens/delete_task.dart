import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/tasks_controllers.dart';
import 'package:todo_app/models/task.dart';

class DeleteTaskDialog extends StatelessWidget {
  final Task task;
  const DeleteTaskDialog({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: Container(
        height: 250.0,
        width: 300,
        color: Colors.white,
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 300.0,
              child: Text(
                'Are you sure you want\nto logout?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 192, 179, 179),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text('No'),
                    ),
                  ),
                ),
                Consumer<TasksController>(
                  builder: (context, tasksController, child) => InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      tasksController.deleteTask(task);
                    },
                    child: Container(
                      height: 50.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text('Yes'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
