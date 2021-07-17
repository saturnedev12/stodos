import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:io';
import 'task.dart';
import 'package:colorize/colorize.dart';

class TaskManager {
  //dynamic path for file
  final String path;
  TaskManager(this.path);

  //check if file already exist or create file
  Future<List> _checkAndGetData() async {
    try {
      return await jsonDecode(await _readFile());
    } catch (e) {
      //print('file create');
      List dt = [
        {'title': 'elementZero', 'level': 3}
      ];
      return dt;
    }
  }

  insertTask(String text, int level) async {
    List data = await (_checkAndGetData() as FutureOr<List<dynamic>>);
    //print(data);
    Task ts = new Task(title: text, level: level);
    data.add(ts.toMap());
    //print(data);
    data = await _rangeBylevel(data);
    //print(data);
    String res = await jsonEncode(data);
    await _writeFile(res);
  }

// range all task by levels
  _rangeBylevel(List datas) async {
    List<List> choices = [[], [], [], []];
    List result = [];
    for (var data in datas) {
      if (data['level'] == 0) {
        choices[0].add(data);
      } else if (data['level'] == 1) {
        choices[1].add(data);
      } else if (data['level'] == 2) {
        choices[2].add(data);
      } else if (data['level'] == 3) {
        choices[3].add(data);
      }
    }
    for (var i = 0; i < choices.length; i++) {
      for (var j = 0; j < choices[i].length; j++) {
        result.add(choices[i][j]);
      }
    }
    result = List.from(result.reversed);
    return result;
  }

  //lis all tasks from the file by levels
  listTasks() async {
    List datas = await (_checkAndGetData() as FutureOr<List<dynamic>>);
    for (var i = 1; i < datas.length; i++) {
      if (datas[i]['level'] == 0) {
        print(Colorize("$i-> ${datas[i]['title']}").green());
      } else if (datas[i]['level'] == 1) {
        print(Colorize("$i-> ${datas[i]['title']}").yellow());
      } else if (datas[i]['level'] == 2) {
        print(Colorize("$i-> ${datas[i]['title']}").red());
      }
    }
  }

  //update a tasks by identity
  updateTask(int index, String text, int level) async {
    List data = await (_checkAndGetData() as FutureOr<List<dynamic>>);
    Task ts = new Task(title: text, level: level);
    data[index] = ts.toMap();
    data = await _rangeBylevel(data);
    String res = await jsonEncode(data);
    await _writeFile(res);
  }

  //delete one task by identity
  removeTask(int index) async {
    List data = await _checkAndGetData();
    if (index != 0) data.removeAt(index);
    String res = await jsonEncode(data);
    await _writeFile(res);
  }

  _readFile() async {
    String data = "{}";
    await File(this.path).readAsString().then((String value) {
      data = value;
    });
    return data;
  }

  _writeFile(String texte) async {
    final filename = this.path;
    await File(filename).writeAsString(texte);
  }
}
