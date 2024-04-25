
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  List toDoList = [];

  // run this method if this is the first time ever opening this app
  final _myBox =  Hive.box('mybox');

  
  void createInitialData(){
    toDoList = [
      ["Code for an hour", false],
    ];
  }

  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDataBase(){
    _myBox.put("TODOLIST", toDoList);
  }
}