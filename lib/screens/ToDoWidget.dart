import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes_app/models/Todo_model.dart';
import 'package:notes_app/screens/edit_todo.dart';
import 'package:notes_app/services/provider_todo.dart';
//import 'package:notes_app/services/utils.dart';
import 'package:provider/provider.dart';

class ToDoWidget extends StatelessWidget {
  final ToDoModel todoModel;
  const ToDoWidget({@required this.todoModel, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
            actionPane: SlidableDrawerActionPane(
              key: Key(todoModel.id),
            ),
            actions: [
              IconSlideAction(
                color: Colors.green[200],
                onTap: () {
                  editToDo(context, todoModel);
                },
                caption: 'Edit',
                icon: Icons.edit,
              ),
            ],
            secondaryActions: [
              IconSlideAction(
                  color: Colors.red,
                  onTap: () {
                    deleteToDo(context, todoModel);
                  },
                  caption: 'Delete',
                  icon: Icons.delete)
            ],
            child: buildToDo(context)),
      );

  Widget buildToDo(BuildContext context) => GestureDetector(
        onTap: () => editToDo(context, todoModel),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.white,
          child: Row(
            children: [
              Checkbox(
                value: todoModel.completed,
                onChanged: (_) {
                  final provider =
                      Provider.of<ToDoProvider>(context, listen: false);
                  final isDone = provider.todoStatus(todoModel);
                },
                checkColor: Colors.pink[400],
                activeColor: Colors.white,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todoModel.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink[400],
                          fontSize: 20),
                    ),
                    if (todoModel.note.isNotEmpty)
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          todoModel.note,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  void deleteToDo(BuildContext context, ToDoModel todo) {
    final provider = Provider.of<ToDoProvider>(context, listen: false);
    provider.deleteToDo(todo);
  }

  // Utils.showSnackNar(context,'Deleted the task');

  void editToDo(BuildContext context, ToDoModel todo) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => EditToDo(todo: todo),
    ));
  }
}
