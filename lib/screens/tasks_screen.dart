import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/controllers/tasks_controllers.dart';
import 'package:todo_app/screens/add_task.dart';
import 'package:todo_app/screens/task_card.dart';

import 'gradient_text.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<TasksController>(
        builder: (context, tasksController, child) {
          return Scaffold(
            // resizeToAvoidBottomInset: true,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => AddTaskScreen(),
                );
              },
              backgroundColor: purple,
              child: const Icon(
                Icons.add,
                size: 40.0,
              ),
            ),
            body: ListView(
              children: [
                ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GradientText(
                      'All Tasks',
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          purple,
                          purple2,
                        ],
                      ),
                    ),
                  ),
                ],
                if (tasksController.tasks.isNotEmpty) ...[
                  ...List.generate(
                    tasksController.undoneTasks.length,
                    (index) => TaskCard(
                      task: tasksController.undoneTasks[index],
                    ),
                  ),
                  ...[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GradientText(
                        'Done',
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            purple,
                            purple2,
                          ],
                        ),
                      ),
                    ),
                  ],
                  ...List.generate(
                    tasksController.doneTasks.length,
                    (index) => TaskCard(
                      task: tasksController.doneTasks[index],
                    ),
                  ),
                ],
                if (tasksController.tasks.isEmpty) ...[
                  // const Spacer(),
                  const Center(child: EmptyToDoScreen()),
                  // const Spacer(),
                ]
              ],
            ),
          );
        },
      ),
    );
  }
}

class EmptyToDoScreen extends StatelessWidget {
  const EmptyToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/dash.png'),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
              children: [
                const TextSpan(
                  text: 'A cool thing that matters begins with a single ',
                ),
                TextSpan(
                    text: 'to-do',
                    style: TextStyle(
                      color: purple,
                    )),
                const TextSpan(text: '!'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
