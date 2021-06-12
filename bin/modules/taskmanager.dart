import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:io';
import 'task.dart';

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
        {'title': 'elementZero'}
      ];
      return dt;
    }
  }

  //insert new task in file
  // ignore: always_declare_return_types
  insertTask(String text) async {
    List data = await (_checkAndGetData() as FutureOr<List<dynamic>>);
    Task ts = new Task(title: text);
    data.add(ts.toMap());
    String res = await jsonEncode(data);
    await _writeFile(res);
  }

  //lis all tasks from the file
  listTasks() async {
    List data = await (_checkAndGetData() as FutureOr<List<dynamic>>);
    for (var i = 1; i < data.length; i++) {
      print(" $i.${data[i]['title']}");
    }
  }

  //update a tasks by identity
  updateTask(int index, String text) async {
    List data = await (_checkAndGetData() as FutureOr<List<dynamic>>);
    Task ts = new Task(title: text);
    data[index] = ts.toMap();
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
