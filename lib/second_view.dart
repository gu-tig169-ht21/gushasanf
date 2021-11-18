import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';
import './main_view.dart';

class SecondView extends StatelessWidget {
  final textController = TextEditingController();
  String input = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 20),
            _inputField(context),
            Container(height: 20),
            _addButtonRow(context),
          ],
        ),
      ),
    );
  }

  // Appbar with some styling according to the theme
  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text('TIG169 TODO', style: Theme.of(context).textTheme.headline1),
      backgroundColor: Theme.of(context).backgroundColor,
      centerTitle: true,
    );
  }

  // Creates textfield which looks like an input field
  Widget _inputField(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
          controller: textController,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'What are you going to do?')),
    );
  }

  // Button to add input from textfield
  Widget _addButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: () {
            input = textController.text;
            Provider.of<MyState>(context, listen: false)
                .addTodo(Todo(name: input));
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainView()));
          },
          icon: Icon(Icons.add, color: Colors.black),
          label: Text(
            'ADD',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }
}
