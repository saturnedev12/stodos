import 'dart:io';
import 'taskmanager.dart';
import 'package:colorize/colorize.dart';

argumentsActions(List arguments, TaskManager tskm) {
  if (arguments[0] == ('add')) {
    //add new task
    stdout.write('new task: ');
    String task = stdin.readLineSync()!;

    stdout.write("select level: ");
    stdout.write(Colorize("O->regular ").green());
    stdout.write(Colorize("1->medium ").yellow());
    stdout.write(Colorize("2->important \n").red());
    stdout.write('level: ');
    try {
      int level = int.parse(stdin.readLineSync()!);
      if (level >= 0 && level <= 2) {
        tskm.insertTask(task, level);
      }
    } catch (e) {
      print("error insert");
    }
  } else if (arguments[0] == 'update') {
    //update task
    try {
      stdout.write('update value: ');
      // ignore: omit_local_variable_types
      String tsk = stdin.readLineSync()!;
      if (arguments[1] != 0) tskm.updateTask(int.parse(arguments[1]) + 1, tsk);
    } catch (e) {
      print('error');
    }
  } else if (arguments[0] == 'remove') {
    //remove one task
    try {
      if (arguments[1] != 0) tskm.removeTask(int.parse(arguments[1]));
    } catch (e) {
      print('error');
    }
  }
}
