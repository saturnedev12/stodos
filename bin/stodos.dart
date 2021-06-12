import 'dart:io';

import 'modules/taskmanager.dart';

void main(List<String> arguments) {
  TaskManager tskm = new TaskManager(".tasks.json");

  if (arguments.isNotEmpty) {
    argumentsActions(arguments, tskm);
  } else {
    tskm.listTasks();
  }
}

argumentsActions(List arguments, TaskManager tskm) {
  if (arguments[0] == '--add') {
    print("insert your new task");
    String task = stdin.readLineSync()!;
    tskm.insertTask(task);
  }
}
