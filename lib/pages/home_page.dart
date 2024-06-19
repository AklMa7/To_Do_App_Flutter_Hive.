import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/utilities/dialog_box.dart';
import 'package:to_do_app/utilities/to_do_tile.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //reference to the box we created in main()
  final _myBox = Hive.box("myBox");

  //Instanciate instance of DB
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the first time ever opening the app , then create default data
    if (_myBox.get("TODOLIST") == null ) {
      //no data in db
      db.createInitialData();
    } else {
      //data already exists
      db.loadData();
    }
      
    
    super.initState();
  }

  //controller for task creation the input field
  final _controller = TextEditingController();

  // CheckBox was tapped ?
  void checkBoxChangeState(bool value , int index) {
    
    setState(() {
      db.toDoList[index][1] = value;
    });
    db.updateData();
  }
  //---------------------

  // create New Task 

  void createNewTask(){
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(controller: _controller, onSave: () => saveNewTask(),  onCancel: () => cancelTask(context), );
      }
      );
  }

  //---------------------

  void saveNewTask(){
    setState((){
      db.toDoList.add( [ _controller.text , false ] );
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();  
    }

  void cancelTask(BuildContext context) {
    Navigator.of(context).pop();
    
  }

  void deleteTask(BuildContext context, int index) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 15,
      backgroundColor: Colors.greenAccent,
      content: const Text('Task deleted successfully !', style: TextStyle(color: Colors.black),),
      duration: const Duration(seconds: 2), 
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Here you can handle undoing the delete action if needed
          // For simplicity, let's assume we don't handle undo here
        },
      ),
    ),
  );
  setState(() {
    db.toDoList.removeAt(index);
  });
  db.updateData();
}

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
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskIsCompleted: db.toDoList[index][1],
            onChanged: (value) =>  checkBoxChangeState( value! , index),
            onPressed: (context) => deleteTask(context ,index),
            );
        },
        
        )
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
