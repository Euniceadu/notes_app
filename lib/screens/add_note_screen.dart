
import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_widget.dart';

class AddNoteScreen extends StatefulWidget {

  const AddNoteScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {}
          )
        ],

      ),
      body: AddNoteWidget(),
    );
  }

}

