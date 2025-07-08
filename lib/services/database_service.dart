import '../models/note.dart';

class DatabaseService {

  static final Map<int, Note> _notesMap = {};

  static int _nextId = 0;

  void addNote(Note note) {
    note.id = _nextId;
    _notesMap[_nextId] = note;
    _nextId = _nextId + 1;
  }

  void updateNote(Note note) {
    // retrieve 
  }

  List<Note> getNotes() {
    return _notesMap.values.toList();
  }

  Note getNote(int id) {
    if(_notesMap.containsKey(id)) {
      return _notesMap[id]!;
    }
    throw Error();
  }

  void deleteNote(int id) {
    if(_notesMap.containsKey(id)) {
      _notesMap.remove(id);
    }
  }

}