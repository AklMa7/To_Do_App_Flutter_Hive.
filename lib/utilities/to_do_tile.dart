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
      padding: const EdgeInsets.only(left: 25.0 , right: 25 ,top: 25  ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(15)
        ),
        child:  Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 25.0 , vertical: 13),
          child:  Row(
            children: [
              //CheckBox
              Checkbox(value: taskIsCompleted, onChanged: onChanged ,  ),

              const SizedBox(width: 5,),
              //Task Name
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskIsCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 2

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}