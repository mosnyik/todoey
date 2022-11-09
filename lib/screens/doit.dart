import 'package:flutter/material.dart';
import 'package:todoey/constants/constants.dart';

class Doit extends StatelessWidget {
  const Doit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Do It Lists'),
          backgroundColor: kAppBackGroundColor,
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: const [
            ListTile(
              title: Text(
                'Day 1 tasks',
              ),
              subtitle: Text('1 task'),
            ),
            ListTile(
              title: Text(
                'Day 2 tasks',
              ),
              subtitle: Text('5 tasks'),
            ),
            ListTile(
              title: Text(
                'Day 3 tasks',
              ),
              subtitle: Text('3 tasks'),
            )
          ],
        ));
  }
}
