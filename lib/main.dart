import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './main_view.dart';
import './model.dart';

void main() {
  var state = MyState();
  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
            bodyText2: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.lineThrough),
          ),
        ));
  }
}
