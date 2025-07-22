import 'package:flutter/material.dart';
import 'package:notes_app/services/database_service.dart';

import '../models/note.dart';

class NoteProvider extends ChangeNotifier {

  List<Note> _notes = [];

  List<Note> get notes => _notes;

  Future<void> saveNote(Note note) async {
    await DatabaseService.instance.createNote(note);
    await getNotes();
  }

  Future<void> updateNote(Note note) async {
    await DatabaseService.instance.updateNote(note);
    await getNotes();
  }


  Future<void> getNotes() async {
    _notes = await DatabaseService.instance.getNotes();
    notifyListeners();
  }

  void deleteNote(String noteId) async {
    await DatabaseService.instance.deleteNote(noteId);
    await getNotes();
  }

}