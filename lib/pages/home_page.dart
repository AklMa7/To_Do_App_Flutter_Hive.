import 'package:flutter/material.dart';
import 'package:to_do_app/utilities/dialog_box.dart';
import 'package:to_do_app/utilities/to_do_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  List toDoList = [
    ["TalentMind StandUp" , false],
    ["Workout" , true],
  ];

  // CheckBox was tapped ?
  void checkBoxChangeState(bool value , int index) {
    
    setState(() {
      toDoList[index][1] = value;
    });
  }
  //---------------------

  // create New Task 

  void createNewTask(){
    showDialog(
      context: context,
      builder: (context) {
        return const DialogBox();
      }
      );

  }

  //---------------------

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),


      floatingActionButton:  FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        onPressed: () => createNewTask(),
        tooltip: 'New Task',
        child: const Icon(Icons.add),
      ),


      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskIsCompleted: toDoList[index][1],
            onChanged: (value) =>  checkBoxChangeState( value! , index),
            );
        },
        
        )
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
