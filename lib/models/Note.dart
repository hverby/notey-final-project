import 'package:flutter/material.dart';

class Note {
  String title;
  String desc;
  DateTime dateTime;
  Color color;
  Note({required this.title, required this.desc, required this.dateTime, required this.color});
}