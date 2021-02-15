import 'package:flutter/material.dart';
import 'package:notes_app/models/Todo_model.dart';
import 'package:notes_app/screens/ToDoWidget.dart';
import 'package:notes_app/services/provider_todo.dart';
import 'package:provider/provider.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ToDoProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? Center(
            child: Text(
              'No Todos',
              style: TextStyle(fontSize: 18),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => Container(
              height: 8,
            ),
            padding: EdgeInsets.all(16),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ToDoWidget(todoModel: todo);
            },
          );
  }
}
