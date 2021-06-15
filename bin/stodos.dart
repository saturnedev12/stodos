import 'dart:io';
import 'modules/eachArgumentsActions.dart';
import 'modules/taskmanager.dart';

void main(List<String> arguments) {
  TaskManager tskm = new TaskManager('.tasks.json');
  if (arguments.isNotEmpty) {
    argumentsActions(arguments, tskm);
  } else {
    tskm.listTasks();
  }
}
