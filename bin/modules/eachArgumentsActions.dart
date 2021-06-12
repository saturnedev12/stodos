import 'dart:io';
import 'taskmanager.dart';

argumentsActions(List arguments, TaskManager tskm) {
  if (arguments[0] == ('--add')) {
    //add new task
    stdout.write('new task: ');
    String task = stdin.readLineSync()!;
    tskm.insertTask(task);
  } else if (arguments[0] == '--update') {
    //update task
    try {
      stdout.write('update value: ');
      String tsk = stdin.readLineSync()!;
      tskm.updateTask(int.parse(arguments[1]), tsk);
    } catch (e) {
      print('error');
    }
  } else if (arguments[0] == '--remove') {
    //remove one task
    try {
      tskm.removeTask(int.parse(arguments[1]));
    } catch (e) {
      print("error");
    }
  }
}
