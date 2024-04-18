
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database.dart';
import 'package:todo_app/to_do_tile.dart';
import 'package:todo_app/my_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();



  
  final _controller = TextEditingController();
  final _controller_2 = TextEditingController();


  @override
  void initState() {
    // if this is the first time ever opening the app, then create default data

    if(_myBox.get("TODOLIST")  == null){
      db.createInitialData();
    }
    else{
      db.loadData();
    }
  
    super.initState();

  }

  


  void onChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();

  }



  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();      
      
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void deleteTask(int index){
    setState(() {
      
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void editTask(int index){
    setState(() {
      

      
    });
  }

  void updateTask(int index){
    setState(() {
      db.toDoList[index][0] = _controller_2.text;
      _controller_2.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(  
        appBar: AppBar(
          title: const Text(
            'TODO',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        
        ),
        body:  ListView.builder(
          itemBuilder: (context, index) {
            return TodoTile(
              value: db.toDoList[index][1],
              onChanged: (value) => onChanged(value, index),
              task: db.toDoList[index][0],
              deleteTask: () => deleteTask(index),
              updateTask: () => updateTask(index),
              controller: _controller_2,
            );
          },
          itemCount: db.toDoList.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
              showDialog(
                context: context, 
                builder: (context) =>  MyDialog(
                  saveNewTask: () {saveNewTask();},
                  controller: _controller,
                  
                )
              );
          },
       
          elevation: 0,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        )        
          
      ),
    );
  }
}