import 'package:flutter/material.dart';

import '../models/note.dart';

class NoteProvider extends ChangeNotifier {

  final Map<String, Note> _notesStore = {};


  void saveNote(String noteId, Note note) {
    _notesStore[noteId] = note;
    notifyListeners();
  }


  List<Note> getNotes() {
    return _notesStore.values.toList();
  }

  Note? getNote(String noteId) {
    return _notesStore[noteId];
  }

  void deleteNote(String noteId) {
    if(_notesStore.containsKey(noteId)) {
      _notesStore.remove(noteId);
      notifyListeners();
    }
  }

}