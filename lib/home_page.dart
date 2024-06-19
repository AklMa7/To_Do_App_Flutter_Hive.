import 'package:flutter/material.dart';
import 'package:to_do_app/utilities/to_do_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.7),
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: ListView(
        children: const   [
          ToDoTile(taskName: 'TalentMind StandUp', taskIsCompleted: true,),
          ToDoTile(taskName: 'Go to the gym', taskIsCompleted: false,),
        ],

      )
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
