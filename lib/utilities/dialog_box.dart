import 'package:flutter/material.dart';
import 'package:to_do_app/utilities/custom_buttom.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('Add a Task')),
      
      content: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Your task here "),
       ),
      
      
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyButton(
              text: 'Save',
              color: Colors.blue,
              icon: Icons.save,
              onPressed: () {
                // Handle the button press
              },
            ),
            MyButton(
              text: 'Cancel',
              color: Colors.red,
              icon: Icons.cancel,
              onPressed: () {
                // Handle the button press
              },
            ),
          ],
        ),
      ],
    );
  }
}