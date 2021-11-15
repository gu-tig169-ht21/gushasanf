import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MainView(),
        theme: ThemeData(
          // Theme settings
          brightness: Brightness.light,
          backgroundColor: Colors.grey,
          fontFamily: 'Roboto',

          // Text themes
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 28.0,
                color: Colors.black,
                fontWeight: FontWeight.normal),
            bodyText1: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
        ));
  }
}

class MainView extends StatelessWidget {
  @override
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
        _dropDown(
          context,
        )
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
    var list = [
      'Write a book',
      'Do homework',
      'Tidy Room',
      'Watch TV',
      'Nap',
      'Shop groceries',
      'Have fun',
      'Meditate',
      'Write a book',
      'Do homework',
      'Tidy Room',
      'Watch TV',
      'Nap',
      'Shop groceries',
      'Have fun',
      'Meditate',
    ];

    return ListView(children: <Widget>[
      // Runs through every item in the list.
      for (var item in list)
        Card(
          child: ListTile(
              leading: Checkbox(
                value: false,
                onChanged: (choice) {},
              ),
              trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {},
              ),
              title: Text(
                item,
                style: Theme.of(context).textTheme.bodyText1,
              )),
        ),
    ]);
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
// Second page

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 20),
            _inputField(),
            Container(height: 20),
            _addButtonRow(context),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text('TIG169 TODO', style: Theme.of(context).textTheme.headline1),
      backgroundColor: Theme.of(context).backgroundColor,
      centerTitle: true,
    );
  }

  Widget _inputField() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'What are you going to do?')),
    );
  }

  Widget _addButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.add_circle, size: 30),
          onPressed: () {},
        ),
        Text(
          'ADD',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
