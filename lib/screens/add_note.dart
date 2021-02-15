import 'package:flutter/material.dart';
import 'package:notes_app/screens/todo_form_widget.dart';

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
      content: Column(
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
            onSavedToDo: () {},
          ),
        ],
      ),
    );
  }
}
