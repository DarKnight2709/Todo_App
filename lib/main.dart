import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/pages/home_page.dart';

void main() async {

  await Hive.initFlutter();

  await Hive.openBox('mybox');
  runApp(const MyTodoApp());
}



class MyTodoApp extends StatelessWidget {
  const MyTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const HomePage(),
    );
  }
}