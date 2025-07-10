import 'package:flutter/material.dart';

import '../models/note.dart';

class NotesListWidget  extends StatelessWidget {
  const NotesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Note> notes = [
      Note(title: "Note 1", content: "Hello World"),
      Note(title: "Grocery List", content: "Bread \n Eggs")
      ];

      return ListView(
        children: [
          for(var item in notes)
          ListTile(
            title: Text(item.title),
          )
        ],
      );

  }

}