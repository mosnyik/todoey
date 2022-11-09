import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constants/constants.dart';
import 'package:todoey/models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  // final Function addTaskCallback;
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTask = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAddTaskScreenBackground,
      child: Container(
        decoration: const BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add a DoIt',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kAppBackGroundColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              TextField(
                onChanged: (newText) {
                  newTask = newText;
                },
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: kAppBackGroundColor, width: 2))),
              ),
              ElevatedButton(
                child: const Text('Add DoIt'),
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTask);
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(kAppBackGroundColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
