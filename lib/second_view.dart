import 'package:flutter/material.dart';

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
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add, color: Colors.black),
          label: Text(
            'ADD',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    );
  }
}
