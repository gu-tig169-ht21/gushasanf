import 'dart:convert';

import './model.dart';
import 'package:http/http.dart' as http;

const API_KEY = '5fc2ec86-6f7b-446a-aa09-ea5123a92db2';
const API_URL = 'https://todoapp-api-pyq5q.ondigitalocean.app';

class Api {
  // Adds a todo
  static Future<List<Todo>> addTodo(Todo item) async {
    Map<String, dynamic> json = Todo.toJson(item);
    var bodyString = jsonEncode(json);
    var response = await http.post(
      Uri.parse('$API_URL/todos?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }

  // Deletes a todo
  static Future removeTodo(String todoId) async {
    var response = await http
        .delete(Uri.parse('$API_URL/todos/$todoId?key=$API_KEY&_confirm=true'));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }

  // Gets all the todos
  static Future<List<Todo>> getTodos() async {
    var response = await http.get(Uri.parse('$API_URL/todos?key=$API_KEY'));
    String bodyString = response.body;
    print(bodyString);
    var json = jsonDecode(bodyString);

    return json.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }

  // Updates a todos status
  static Future updateTodo(Todo item, choice) async {
    String todoId = item.id;
    item.status = choice;
    Map<String, dynamic> json = Todo.toJson(item);
    var bodyString = jsonEncode(json);
    var response = await http.put(
      Uri.parse('$API_URL/todos/$todoId?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
  }
}
