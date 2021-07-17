import 'dart:io';
import 'modules/eachArgumentsActions.dart';
import 'modules/taskmanager.dart';

void main(List<String> arguments) async {
  TaskManager tskm = new TaskManager('.tasks.json');
  //print(await tskm.rangeBylevel());
  if (arguments.isNotEmpty) {
    argumentsActions(arguments, tskm);
  } else {
    tskm.listTasks();
  }
}
