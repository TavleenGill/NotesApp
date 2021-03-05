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

  List<ToDoModel> get todosCompleted =>
      _todos.where((todoModel) => todoModel.completed == true).toList();

  void addToDo(ToDoModel todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void deleteToDo(ToDoModel todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  bool todoStatus(ToDoModel todo) {
    todo.completed = !todo.completed;

    notifyListeners();
    return todo.completed;
  }

  void updateTodo(ToDoModel toDoModel, String title, String note) {
    toDoModel.title = title;
    toDoModel.note = note;

    notifyListeners();
  }
}
