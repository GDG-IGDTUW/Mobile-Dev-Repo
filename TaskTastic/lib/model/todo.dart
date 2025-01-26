class ToDo {
  String? id;
  String? todoText;
  bool isDone;
  DateTime ?dueDate;
  int ?priority;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
    this.dueDate,
    this.priority=0,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Excercise', isDone: true ,dueDate: DateTime.now().subtract(Duration(days: 1)),priority: 2),
      ToDo(id: '02', todoText: 'Buy Groceries', isDone: true, dueDate: DateTime.now(),priority: 1),
      ToDo(id: '03', todoText: 'Check Emails', dueDate: DateTime.now().add(Duration(days: 1)),priority: 3),
      ToDo(id: '04', todoText: 'Team Meeting',dueDate: DateTime.now().add(Duration(days: 3)) ,priority: 2),
      ToDo(id: '05', todoText: 'Work on mobile apps for 2 hour', dueDate: DateTime.now().add(Duration(days: 7)),priority: 1),
      ToDo(id: '06', todoText: 'Dinner with Jenny', dueDate: DateTime.now().add(Duration(days: 10)),priority: 3),
    ];
  }
}