

import 'package:flutter/material.dart';


class MyDialog extends StatelessWidget {
  const MyDialog({super.key, required this.saveNewTask, required this.controller}) ;

  final Function saveNewTask;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      
      title:  const Text('Add Task'),
      content:  SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Task name',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: (){
                    controller.clear();
                  }, 
                  icon: const Icon(Icons.clear)
                  )
                ),
              ),
            Row(
              children: [
                TextButton(onPressed: () {
                  if(controller.text.isEmpty){
                    showDialog(
                      context: context, 
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Task name cannot be empty!'),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.of(context).pop();
                            }, 
                            child: const Text('OK'))
                          ],
                        );

                      });
                  }else{
                    saveNewTask();
                  }
                  
                  
                  
                }, child: const Text('Save')),
                TextButton(onPressed: (){
                  controller.clear();
                  Navigator.of(context).pop();
                }, 
                child: const Text('Cancel'))
              ],
            )
          ],
        )
        ,
      )
    );
  }
}