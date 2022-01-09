import 'dart:convert';

import 'package:fg_demo/controllers/notes_database_controller.dart';
import 'package:fg_demo/globals/database_commands.dart';
import 'package:fg_demo/models/models_index.dart';
import 'package:flutter/foundation.dart';

class NotesController extends ChangeNotifier {
  final List<NotesModel> _notesList = [];

  List<NotesModel> get notesList => _notesList;

  NotesController() {
    _initializeNotes();
  }

  void _initializeNotes() async {
    List<Map<String, dynamic>> notes = await NotesDBController.readAllNotes();

    for (Map<String, dynamic> note in notes) {
      print(note);
      final NotesModel noteModel = NotesModel.fromJson(jsonDecode(note[kDataColumnName]));
      _notesList.add(noteModel);
    }

    notifyListeners();
  }

  void addNotes(NotesModel note) {
    _notesList.add(note);
    NotesDBController.insertNote(
        {kIDColumnName: note.id, kDataColumnName: jsonEncode(note.toJson())});
    notifyListeners();
  }

  void removeNote(NotesModel note) {
    _notesList.remove(note);
    NotesDBController.deleteNote(note.id);
    notifyListeners();
  }

  void editNote(NotesModel note, int index) {
    _notesList[index] = note;
    NotesDBController.insertNote(
        {kIDColumnName: note.id, kDataColumnName: jsonEncode(note.toJson())});
    notifyListeners();
  }
}
