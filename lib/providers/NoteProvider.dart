import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:notey/models/Note.dart';

class NoteProvider with ChangeNotifier {

  List<Note> _notes = [];
  List<Note> _oldNotes = [];

  void addNote(Note note){
    _notes.add(note);
    _oldNotes.add(note);
    notifyListeners();
  }
  UnmodifiableListView<Note> get allNotes => UnmodifiableListView(_notes);

  void deleteTodo(Note note) {
    _notes.remove(note);
    notifyListeners();
  }
  void filterNotes(Color color) {
    _notes = _oldNotes.where((element) => element.color == color).toList();
    notifyListeners();
  }
  void resetNotes() {
    _notes = _oldNotes;
    notifyListeners();
  }
}