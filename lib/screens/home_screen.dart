
import 'package:flutter/material.dart';
import 'package:notes_app/screens/add_note_screen.dart';
import 'package:notes_app/widgets/notes_list_widget.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget screen = NotesListWidget();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: Scaffold(
      appBar: AppBar(title: const Text('Notes App'),),
      body: screen,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => AddNoteScreen())
            );
        },
        child: const Icon(Icons.add_outlined),
        ),
    ),
    );
  }

}

