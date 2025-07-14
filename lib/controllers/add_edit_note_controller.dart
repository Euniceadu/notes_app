
import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:provider/provider.dart';


class AddEditNoteController extends ChangeNotifier {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  int wordCount = 0;

  final String? noteId;

  AddEditNoteController({
    this.noteId,
    String? title,
    String? content
  }) {
    titleController.text = title ?? '';
    contentController.text = content ?? '';
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

    Note note = Note(
      id: noteId ?? UniqueKey().toString(),
      title: titleController.text.trim(), content: contentController.text.trim());

    context.read<NoteProvider>().saveNote(note.id!, note);
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}