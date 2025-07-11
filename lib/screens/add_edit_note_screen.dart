
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/controllers/add_edit_note_controller.dart';


import '../models/note.dart';

class AddEditNoteScreen extends StatefulWidget {

  const AddEditNoteScreen({super.key, Note? note});

  final Note? note = null;

  @override
  State<StatefulWidget> createState() => _AddEditNoteScreenState();
  
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {

  // final titleController = TextEditingController();
  // final contentController = TextEditingController();
  

  // int wordCount = 0;

  @override
  Widget build(BuildContext context) {

    final controller = context.watch<AddEditNoteController>();
    int wordCount = controller.wordCount;

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Title'
              ),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
              controller: controller.titleController,
            ),
            SizedBox(height: 10,),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write your note...'
                ),
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
                controller: controller.contentController,
                onChanged: (value) {
                  controller.calculateWordCount();
                },
              )
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                Text('$wordCount words')
              ],
            )
          ],
        ),
      ) 
  
    );
  }

  // void _getWordCount() {
  //   setState(() {
  //     wordCount = contentController.text.trim().split(' ').length;
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }
}

