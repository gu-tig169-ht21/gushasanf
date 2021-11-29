import 'package:flutter/material.dart';
import './api.dart';

// The class Todo which represents one item to do
class Todo {
  String id;
  String name;
  bool status;

  Todo({this.id = '', required this.name, this.status = false});

  // Converting a Todo object to json
  static Map<String, dynamic> toJson(Todo item) {
    return {
      'title': item.name,
      'done': item.status,
    };
  }

  // Converting from json to a Todo object
  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      name: json['title'],
      status: json['done'],
    );
  }
}

// The class MyState which creates a list of Todos
// and enables modiyfing items in it
class MyState extends ChangeNotifier {
  List<Todo> _list = [];
  String _filterBy = 'All';

  List<Todo> get list => _list;

  String get filterBy => _filterBy;

  Future getList() async {
    List<Todo> list = await Api.getTodos();
    _list = list;
    notifyListeners();
  }

  void addTodo(Todo item) async {
    _list = await Api.addTodo(item);
    notifyListeners();
  }

  void removeTodo(Todo item) async {
    _list = await Api.removeTodo(item.id);
    notifyListeners();
  }

  void changeStatus(Todo item, choice) async {
    await Api.updateTodo(item, choice);
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
