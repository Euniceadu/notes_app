import 'package:flutter/material.dart';
import 'package:notes_app/services/database_service.dart';
import 'package:sqflite/sqflite.dart';

import '../models/note.dart';

class NoteProvider extends ChangeNotifier {

  final Map<String, Note> _notesStore = {};

  List<Note> _notes = [];

  List<Note> get notes => _notes;

  Future<void> saveNote(Note note) async {
    await DatabaseService.instance.createNote(note);
    await getNotes();
  }


  Future<void> getNotes() async {
    _notes = await DatabaseService.instance.getNotes();
    notifyListeners();
  }

  Note? getNote(String noteId) {
    return _notesStore[noteId];
  }

  void deleteNote(String? noteId) {
    if(_notesStore.containsKey(noteId)) {
      _notesStore.remove(noteId);
      notifyListeners();
    }
  }

}