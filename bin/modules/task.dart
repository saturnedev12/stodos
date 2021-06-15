//i can get task form a map forme
class Task {
  final String? title;
  final int? level;

  Task({this.title, this.level});
  Map<String, dynamic> toMap() {
    return {'title': title, 'level': level};
  }

  @override
  String toString() {
    return 'Task{title: $title, level: $level}';
  }
}
