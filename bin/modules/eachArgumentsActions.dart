import 'dart:io';
import 'taskmanager.dart';
import 'package:colorize/colorize.dart';

argumentsActions(List arguments, TaskManager tskm) {
  if (arguments[0] == ('add')) {
    //add new task
    stdout.write('new task: ');
    String task = stdin.readLineSync()!;

    var level = choiceLevel(tskm);
    tskm.insertTask(task, level);
  } else if (arguments[0] == 'update') {
    //update task
    if (arguments.length > 1) {
      try {
        stdout.write('update value: ');
        // ignore: omit_local_variable_types
        String text = stdin.readLineSync()!;
        int level = choiceLevel(tskm);

        if (arguments[1] != 0)
          tskm.updateTask(int.parse(arguments[1]), text, level);
      } catch (e) {}
    } else {
      errorIndex();
    }
  } else if (arguments[0] == 'remove') {
    //remove one task
    try {
      if (arguments[1] != 0) tskm.removeTask(int.parse(arguments[1]));
      //print(int.parse(arguments[1]));
    } catch (e) {
      errorIndex();
    }
  } else if (arguments[0] == '--help') {
    print('''
                                                                     dddddddd                                  
                          tttt                                       d::::::d                                  
                       ttt:::t                                       d::::::d                                  
                       t:::::t                                       d::::::d                                  
                       t:::::t                                       d:::::d                                   
    ssssssssss   ttttttt:::::ttttttt       ooooooooooo       ddddddddd:::::d    ooooooooooo       ssssssssss   
  ss::::::::::s  t:::::::::::::::::t     oo:::::::::::oo   dd::::::::::::::d  oo:::::::::::oo   ss::::::::::s  
ss:::::::::::::s t:::::::::::::::::t    o:::::::::::::::o d::::::::::::::::d o:::::::::::::::oss:::::::::::::s 
s::::::ssss:::::stttttt:::::::tttttt    o:::::ooooo:::::od:::::::ddddd:::::d o:::::ooooo:::::os::::::ssss:::::s
 s:::::s  ssssss       t:::::t          o::::o     o::::od::::::d    d:::::d o::::o     o::::o s:::::s  ssssss 
   s::::::s            t:::::t          o::::o     o::::od:::::d     d:::::d o::::o     o::::o   s::::::s      
      s::::::s         t:::::t          o::::o     o::::od:::::d     d:::::d o::::o     o::::o      s::::::s   
ssssss   s:::::s       t:::::t    tttttto::::o     o::::od:::::d     d:::::d o::::o     o::::ossssss   s:::::s 
s:::::ssss::::::s      t::::::tttt:::::to:::::ooooo:::::od::::::ddddd::::::ddo:::::ooooo:::::os:::::ssss::::::s
s::::::::::::::s       tt::::::::::::::to:::::::::::::::o d:::::::::::::::::do:::::::::::::::os::::::::::::::s 
 s:::::::::::ss          tt:::::::::::tt oo:::::::::::oo   d:::::::::ddd::::d oo:::::::::::oo  s:::::::::::ss  
  sssssssssss              ttttttttttt     ooooooooooo      ddddddddd   ddddd   ooooooooooo     sssssssssss    
                                                                                                               
                                                                                                               
      usage: stodos [add] || [update] || [remove]
          
          add       (add new task in the list take and give level number)
          update    (update a existing task by index)
          remove    (remove a existing task by index) 

    ''');
  } else {
    print(
        "stodos: '${arguments[0]}' is not a stodos command. See 'stodos --help'");
    print('''

        usage: stodos [add] [update] [remove] 
    ''');
  }
}

errorIndex() {
  print(Colorize("the index must be a integer").red());
}

choiceLevel(TaskManager tskm) {
  stdout.write("select level: ");
  stdout.write(Colorize("O->regular ").green());
  stdout.write(Colorize("1->medium ").yellow());
  stdout.write(Colorize("2->important \n").red());
  stdout.write('level: ');
  try {
    int level = int.parse(stdin.readLineSync()!);
    if (level >= 0 && level <= 2) {
      return level;
    }
  } catch (e) {
    int level = 0;
    return level;
  }
}
