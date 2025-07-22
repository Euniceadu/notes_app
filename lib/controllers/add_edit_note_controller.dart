
import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:provider/provider.dart';


class AddEditNoteController extends ChangeNotifier {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  int wordCount = 0;

  final Note? note;

  AddEditNoteController({
    this.note
  }) {
    if(note != null) {
      titleController.text = note!.title;
      contentController.text = note!.content;
    } else {
      titleController.text = '';
      contentController.text = '';
    }
    
    calculateWordCount();
  }

  void calculateWordCount() {
    wordCount = contentController.text.trim().split(' ').length;
    notifyListeners();
  }

  void saveNote(BuildContext context) {
    if(titleController.text.trim().isEmpty && 
    contentController.text.trim().isEmpty) {
      return;
    }

    if (note != null) {
      Note updatedNote = Note(
        id: note!.id,
        title: titleController.text.trim(), 
        content: contentController.text.trim(),
        dateCreated: note!.dateCreated);
      context.read<NoteProvider>().updateNote(updatedNote);
    } else {
      Note newNote = Note(
        id: UniqueKey().toString(),
        title: titleController.text.trim(), 
        content: contentController.text.trim());
      context.read<NoteProvider>().saveNote(newNote);
    }

  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}