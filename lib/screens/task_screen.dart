import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constants/constants.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/screens/doit.dart';
import 'package:todoey/widgets/widget.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBackGroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kAppBackGroundColor,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskScreen(),
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: kWhite,
          size: 30,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: kTaskScreenDisplayPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Doit()));
                  },
                  child: const CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30,
                      color: kAppBackGroundColor,
                    ),
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'DoIt',
                  style: TextStyle(
                    color: kWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 50,
                  ),
                ),
                Text('${Provider.of<TaskData>(context).taskCount} Tasks',
                    style: const TextStyle(
                      color: kWhite,
                      fontSize: 18,
                    )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TaskListView(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
