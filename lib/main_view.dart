import 'package:flutter/material.dart';
import 'second_view.dart';
import 'package:provider/provider.dart';

class MyState extends ChangeNotifier {
  // Lite kod
}

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainViewState();
  }
}

class MainViewState extends State<StatefulWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _list(context),
      floatingActionButton: _floatingAction(context),
    );
  }

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

  Widget _dropDown(BuildContext context) {
    return PopupMenuButton(
        icon: Icon(Icons.more_vert, color: Colors.black),
        itemBuilder: (context) => [
              PopupMenuItem(child: Text('All')),
              PopupMenuItem(child: Text('Done')),
              PopupMenuItem(child: Text('Undone'))
            ]);
  }

  Widget _list(BuildContext context) {
    var clean = Todo(name: 'Clean');
    var book = Todo(name: 'Write a book');
    var medi = Todo(name: 'Meditate', status: true);
    var walk = Todo(name: 'Walk');
    var run = Todo(name: 'Run');
    var sleep = Todo(name: 'Sleep');

    var list = [
      clean,
      book,
      medi,
      walk,
      run,
      sleep,
    ];

    return StatefulBuilder(
      builder: (context, setState) => (ListView(
        children: <Widget>[
          // Runs through every item in the list.
          for (var item in list)
            Card(
              child: ListTile(
                  leading: Checkbox(
                    value: item.status,
                    onChanged: (bool? choice) {
                      setState(() {
                        item.status = choice;
                      });
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        list.remove(item);
                      });
                    },
                  ),
                  title: Text(
                    item.name,
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
            ),
        ],
      )),
    );
  }

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
}

// ----------------------------------------------------------------------
// The class todo
class Todo {
  final String name;
  bool? status;

  Todo({required this.name, this.status = false});

  set isCompleted(bool value) {
    isCompleted = value;
  }
}
