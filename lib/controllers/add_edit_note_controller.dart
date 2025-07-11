
import 'package:flutter/material.dart';

class AddEditNoteController extends ChangeNotifier {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  int wordCount = 0;

  final int? noteId;

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

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}