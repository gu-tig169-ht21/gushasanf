import 'package:flutter/material.dart';

// The class Todo which represents one item to do
class Todo {
  String name;
  bool? status;

  Todo({required this.name, this.status = false});
}

// The class MyState which creates a list of Todos
// and enables modiyfing items in it
class MyState extends ChangeNotifier {
  List<Todo> _list = [];

  List<Todo> get list => _list;

  void addTodo(Todo item) {
    _list.add(item);
    notifyListeners();
  }

  void removeTodo(Todo item) {
    _list.remove(item);
    notifyListeners();
  }

  void changeStatus(Todo item, choice) {
    item.status = choice;
    notifyListeners();
  }
}
