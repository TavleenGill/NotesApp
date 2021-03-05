import 'package:flutter/material.dart';
import 'package:notes_app/screens/ToDo_list.dart';
import 'package:notes_app/screens/add_note.dart';
import 'package:notes_app/screens/completed_list._widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      ToDoList(),
      CompletedListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('My To Do App'),
        backgroundColor: Colors.pink[400],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.pink[400],
          unselectedItemColor: Colors.white.withOpacity(0.7),
          selectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined),
              label: 'To dos',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.check_box_outlined), label: 'Completeed')
          ]),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(Icons.add),
        backgroundColor: Colors.pink[400],
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => AddNoteDialog(),
              barrierDismissible: true);
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}
