
import 'package:flutter/material.dart';
import 'package:notes_app/controllers/add_edit_note_controller.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:notes_app/screens/add_edit_note_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String searchQuery = 'p';

  @override
  Widget build(BuildContext context) {

    var noteList = context.watch<NoteProvider>().getNotes();

    var searchResults = noteList.where((element) {
      return element.title.toLowerCase().contains(searchQuery.toLowerCase()) || 
      element.content.toLowerCase().contains(searchQuery.toLowerCase());
    },).toList();

    return MaterialApp(
      title: '',
      home: Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search Notes...',
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
          ),
          onChanged: (value) {
            setState(() {
              searchQuery = value;
            });
          },
        )
      ),
      body: ListView(
        children: [
          for(var item in searchResults)
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

