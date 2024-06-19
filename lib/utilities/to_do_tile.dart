import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskIsCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? onPressed;

  const ToDoTile({
  super.key,
  required this.taskName,
  required this.taskIsCompleted,
  required this.onChanged ,
  required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0 , right: 25 ,top: 25  ),
      child: Slidable(
        enabled: true,
        direction: Axis.horizontal,
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onPressed,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(15),

              )
              
          ],
        ),
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
      ),
    );
  }
}