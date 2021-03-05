import 'package:flutter/material.dart';

class ToDoFormWidget extends StatelessWidget {
  final String title;
  final String note;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedNote;
  final VoidCallback onSavedToDo;

  const ToDoFormWidget({
    Key key,
    this.title = '',
    this.note = '',
    @required this.onChangedTitle,
    @required this.onChangedNote,
    @required this.onSavedToDo,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(),
          buildNote(),
          SizedBox(
            height: 30,
          ),
          save()
        ],
      ),
    );
  }

  Widget buildTitle() => TextFormField(
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title.isEmpty) {
            return 'Title cannot be empty';
          }
          return null;
        },
        decoration:
            InputDecoration(border: UnderlineInputBorder(), labelText: 'Title'),
      );

  Widget buildNote() => TextFormField(
        initialValue: note,
        maxLines: null,
        onChanged: onChangedNote,
        decoration:
            InputDecoration(border: UnderlineInputBorder(), labelText: 'Note'),
      );

  Widget save() => InkWell(
        child: Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ),
        onTap: onSavedToDo,
      );
}
