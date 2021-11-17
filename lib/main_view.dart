import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';
import './second_view.dart';
import './todo_list.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Consumer<MyState>(
        builder: (context, state, child) =>
            TodoList(_filterList(state.list, state.filterBy)),
      ),
      floatingActionButton: _floatingAction(context),
    );
  }

  // Appbar with some styling according to the theme
  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text('TIG169 TODO', style: Theme.of(context).textTheme.headline1),
      backgroundColor: Theme.of(context).backgroundColor,
      centerTitle: true,
      actions: [
        _dropDown(context),
      ],
    );
  }

  // Dropdown menu for sorting items
  Widget _dropDown(BuildContext context) {
    return PopupMenuButton(
        icon: Icon(Icons.more_vert),
        onSelected: (String value) {
          Provider.of<MyState>(context, listen: false).setFilterBy(value);
        },
        itemBuilder: (context) => [
              PopupMenuItem(child: Text('All'), value: 'All'),
              PopupMenuItem(child: Text('Done'), value: 'Done'),
              PopupMenuItem(child: Text('Undone'), value: 'Undone'),
            ]);
  }

  // Button for navigating to secondview
  Widget _floatingAction(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondView()));
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  // Sorting shown items on mainview based on selected value from dropdown
  List<Todo> _filterList(list, filterBy) {
    if (filterBy == 'All') {
      return list;
    }
    if (filterBy == 'Done') {
      return list.where((item) => item.status == true).toList();
    }

    if (filterBy == 'Undone') {
      return list.where((item) => item.status == false).toList();
    }
    throw [''];
  }
}
