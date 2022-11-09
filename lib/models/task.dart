class Task {
  final String name;
  bool taskStatus;
  Task({this.name = '', this.taskStatus = false});

  void toggleTaskStatus() {
    taskStatus = !taskStatus;
  }
}
