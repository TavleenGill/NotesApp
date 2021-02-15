import 'package:flutter/material.dart';
import 'package:notes_app/models/Todo_model.dart';

class ToDoProvider extends ChangeNotifier {
  List<ToDoModel> _todos = [
    ToDoModel(createdTime: DateTime.now(), title: 'Drink water', note: ''),
    ToDoModel(createdTime: DateTime.now(), title: 'Buy Things', note: '''-Eggs 
-Milk
-Bread'''),
    ToDoModel(
        createdTime: DateTime.now(),
        title: 'Laundary',
        note: 'wash clothes,dry and fold'),
    ToDoModel(
        createdTime: DateTime.now(), title: 'Meet friend', note: 'Anjali tue')
  ];

  List<ToDoModel> get todos =>
      _todos.where((todoModel) => todoModel.completed == false).toList();
}
