import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ambition/modules/archived_tasks/archived_tasks_page.dart';
import 'package:ambition/modules/done_tasks/done_tasks_page.dart';
import 'package:ambition/modules/new_tasks/new_tasks_page.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  // for logic
  int currentIndex = 0;
  bool isBottomSheetShown = false;

  // keys
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  //controllers
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  List<Widget> pages = [
    NewTasksPage(),
    DoneTasksPage(),
    ArchivedTasksPage(),
  ];

  List<String> titles = [
    "New Tasks",
    "Done Tasks",
    "Archived Tasks",
  ];

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(titles[currentIndex]),
      ),
      body: pages[currentIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: "Done",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: "Archived",
          ),
        ],
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}