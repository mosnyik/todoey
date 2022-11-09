import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constants/constants.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';

bool isChecked = false;

class TaskTile extends StatelessWidget {
  const TaskTile(
      {Key? key,
      required this.taskTitle,
      required this.isChecked,
      required this.checkBoxState,
      required this.deleteTask})
      : super(key: key);

  final String taskTitle;
  final bool isChecked;
  final Function(bool?) checkBoxState;
  final Function() deleteTask;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: deleteTask,
        title: Text(
          taskTitle,
          style: isChecked
              ? const TextStyle(decoration: TextDecoration.lineThrough)
              : null,
        ),
        trailing: Checkbox(
          activeColor: kAppBackGroundColor,
          value: isChecked,
          onChanged: checkBoxState,
          checkColor: kWhite,
          fillColor: MaterialStateProperty.all(kAppBackGroundColor),
        ));
  }
}
// The list of all tasks added to the task screen, consist of task tiles

class TaskListView extends StatefulWidget {
  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.taskStatus,
              checkBoxState: (checkBoxValue) {
                taskData.updateTask(task);
              },
              deleteTask: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
