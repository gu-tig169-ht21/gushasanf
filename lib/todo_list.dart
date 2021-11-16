import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';

class TodoList extends StatelessWidget {
  final List<Todo> list;

  TodoList(this.list);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: list.map((item) => _todoItem(context, item)).toList());
  }

  // Represents a card in the list
  Widget _todoItem(context, item) {
    return Card(
      child: ListTile(
        // Checkbox to the left in each card
        leading: Checkbox(
          value: item.status,
          onChanged: (bool? choice) {
            Provider.of<MyState>(context, listen: false)
                .changeStatus(item, choice);
          },
        ),
        // Text of the todo in the middle of each card
        title: Text(
          item.name,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        // Delete button to the right in each card
        trailing: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Provider.of<MyState>(context, listen: false).removeTodo(item);
          },
        ),
      ),
    );
  }
}
