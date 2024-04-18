import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.task,
      required this.deleteTask,
      required this.updateTask,
      required this.controller,z
      
      });

  final bool value;
  final Function(bool?)? onChanged;
  final String task;
  final Function() deleteTask;
  final Function() updateTask;
  final TextEditingController controller;
  

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.grey[200],
        child: Row(
          children: [
            Checkbox(value: value, onChanged: onChanged),
            Text(
              task,
              style: TextStyle(
                  decoration: value == true
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontSize: 20
              ),
                         
            ),


            const Expanded(
              child: SizedBox(
                width: 100,
              )
            ),

            IconButton(
              onPressed: (){
                controller.text = task;
                showDialog(
                  context: context, 
                  builder: (context) {
                    return  AlertDialog(
                      title: const Text('Edit Task'),
                      content: SizedBox(
                        height: 120,
                        child: Column(
                          children: [
                            TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                hintText: 'Edit Task',
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    controller.clear();
                                  }, 
                                  icon: const Icon(Icons.clear))
                              ),
                              
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            TextButton(
                              onPressed: updateTask,
                              child: const Text("Update")),
                          ],
                        ),

                      ),

                    );
                  }

                  
                );
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: deleteTask, 
              icon: const Icon(Icons.delete)
            ),
          ],
        ),
      ),
    );
  }
}
