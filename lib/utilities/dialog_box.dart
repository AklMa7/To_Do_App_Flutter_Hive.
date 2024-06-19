import 'package:flutter/material.dart';
import 'package:to_do_app/utilities/custom_buttom.dart';

class DialogBox extends StatelessWidget {
  final controller;

  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({super.key , required this.controller ,required this.onCancel , required this.onSave });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('Add a Task')),
      
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
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
              onPressed: () => onSave(),
            ),
            MyButton(
              text: 'Cancel',
              color: Colors.red,
              icon: Icons.cancel,
              onPressed: () {
                onCancel();
              },
            ),
          ],
        ),
      ],
    );
  }
}