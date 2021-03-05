import 'package:flutter/material.dart';
import 'package:notes_app/models/Todo_model.dart';
import 'package:notes_app/screens/todo_form_widget.dart';
import 'package:notes_app/services/provider_todo.dart';
import 'package:provider/provider.dart';

class EditToDo extends StatefulWidget {
  final ToDoModel todo;
  const EditToDo({Key key, @required this.todo}) : super(key: key);

  @override
  _EditToDoState createState() => _EditToDoState();
}

class _EditToDoState extends State<EditToDo> {
  final _formKey = GlobalKey<FormState>();
  String title;
  String note;
  //void saveTodo;

  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
    note = widget.todo.note;
  }

  @override
  Widget build(BuildContext cotext) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit To Do'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                final provider =
                    Provider.of<ToDoProvider>(context, listen: false);
                provider.deleteToDo(widget.todo);

                Navigator.of(context).pop();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ToDoFormWidget(
            title: title,
            note: note,
            onChangedTitle: (title) => setState(
              () => this.title = title,
            ),
            onChangedNote: (note) => setState(() => this.note = note),
            onSavedToDo: saveTodo,
          ),
        ),
      ),
    );
  }

  void saveTodo() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<ToDoProvider>(context, listen: false);
      provider.updateTodo(widget.todo, title, note);
      Navigator.of(context).pop();
    }
  }
}
