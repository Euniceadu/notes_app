
import 'package:flutter/material.dart';
import 'package:notes_app/controllers/add_edit_note_controller.dart';
import 'package:notes_app/screens/add_edit_note_screen.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = [
    Note(id: 1, title: "Note 1", content: "Hello World"),
    Note(id: 2, title: "Grocery List", content: "Bread \n Eggs")
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: Scaffold(
      appBar: AppBar(title: const Text('Notes App'),),
      body: ListView(
        children: [
          for(var item in notes)
          ListTile(
            title: Text(item.title),
            onTap: () {
              Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider(
                create: (_) => AddEditNoteController(
                  noteId: item.id,
                  title: item.title,
                  content: item.content
                ),
                child: AddEditNoteScreen()
                ),
            )
          );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider(
                create: (_) => AddEditNoteController(),
                child: AddEditNoteScreen()
                ),
            )
          );
        },
        child: const Icon(Icons.add_outlined),
        ),
    ),
    );
  }

}

