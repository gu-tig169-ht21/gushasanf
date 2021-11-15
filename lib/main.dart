import 'package:flutter/material.dart';

import 'main_view.dart';

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
