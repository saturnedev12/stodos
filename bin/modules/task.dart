//i can get task form a map forme
class Task {
  final String? title;

  Task({
    this.title,
  });
  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }

  @override
  String toString() {
    return 'Task{title: $title}';
  }
}
