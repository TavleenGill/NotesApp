import 'package:flutter/material.dart';
import 'package:notes_app/models/Todo_model.dart';
import 'package:notes_app/screens/todo_form_widget.dart';
import 'package:notes_app/services/provider_todo.dart';
import 'package:provider/provider.dart';

class AddNoteDialog extends StatefulWidget {
  AddNoteDialog({Key key}) : super(key: key);

  @override
  _AddNoteDialogState createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends State<AddNoteDialog> {
  final _formkey = GlobalKey<FormState>();
  String title = '';
  String note = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add ToDo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(height: 8),
            ToDoFormWidget(
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedNote: (note) => setState(() => this.note = note),
              onSavedToDo: () {
                addToDo();
                //print(title);
                //print(note);
              },
            ),
          ],
        ),
      ),
    );
  }

  void addToDo() {
    final isValid = _formkey.currentState.validate();

    if (!isValid)
      return;
    else {
      final todo = ToDoModel(
          id: DateTime.now().toString(),
          createdTime: DateTime.now(),
          title: title,
          note: note);

      final provider = Provider.of<ToDoProvider>(context, listen: false);
      provider.addToDo(todo);

      Navigator.of(context).pop();
    }
  }
}
