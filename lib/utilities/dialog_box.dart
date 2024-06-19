import 'package:flutter/material.dart';
import 'package:to_do_app/utilities/custom_buttom.dart';

class DialogBox extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  _DialogBoxState createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('Add a Task')),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: widget.controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Your task here",
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please write the name of your task :3';
            }
            return null;
          },
        ),
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
                if (_formKey.currentState!.validate()) {
                  widget.onSave();
                }
              },
            ),
            MyButton(
              text: 'Cancel',
              color: Colors.red,
              icon: Icons.cancel,
              onPressed: () {
                widget.onCancel();
              },
            ),
          ],
        ),
      ],
    );
  }
}
