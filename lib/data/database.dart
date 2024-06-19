import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {


  List toDoList = [];
  //reference the box
  final _myBox = Hive.box("myBox");

  //run this if this is the first time ever runnin this app
  void createInitialData(){
    toDoList = [
      ["Example task" , false]
    ];
  }

  //load the data
  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  //Update data 

  void updateData(){
    _myBox.put("TODOLIST", toDoList);
  }

}