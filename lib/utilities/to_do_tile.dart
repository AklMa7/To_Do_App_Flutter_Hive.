import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskIsCompleted;
  final Function(bool?)? onChanged;

  const ToDoTile({
  super.key,
  required this.taskName,
  required this.taskIsCompleted,
  this.onChanged 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
          borderRadius: BorderRadius.circular(15)
        ),
        child:  Padding(
          padding:  const EdgeInsets.all(25.0),
          child:  Row(
            children: [
              //CheckBox
              Checkbox(value: taskIsCompleted, onChanged: onChanged ,  ),

              const SizedBox(width: 5,),
              //Task Name
              Text(
                taskName
              ),
            ],
          ),
        ),
      ),
    );
  }
}