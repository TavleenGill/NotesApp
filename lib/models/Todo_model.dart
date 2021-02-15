import 'package:flutter/cupertino.dart';

class ToDoField {
  static const createdTime = 'created time';
}

class ToDoModel {
  DateTime createdTime;
  String title;
  String id;
  String note;
  bool completed;

  ToDoModel({
    @required this.createdTime,
    @required this.title,
    this.note,
    this.id,
    this.completed = false,
  });
}
