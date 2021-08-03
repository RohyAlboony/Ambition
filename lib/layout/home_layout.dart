import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/modules/archived_tasks/archived_tasks_page.dart';
import 'package:todo_app/modules/done_tasks/done_tasks_page.dart';
import 'package:todo_app/modules/new_tasks/new_tasks_page.dart';
import 'package:todo_app/shared/components/components.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  // for logic
  int currentIndex = 0;
  bool isBottomSheetShown = false;

  // db
  Database db;

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
    "New Taskss",
    "Done Tasks",
    "Archived Tasks",
  ];

  @override
  void initState(){
    super.initState();
    createDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(titles[currentIndex]),
      ),
      body: pages[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          if(isBottomSheetShown)
          {
            Navigator.pop(context);
            setState(() {
              isBottomSheetShown = false;
            });
          }
          else
          {
            scaffoldKey.currentState.showBottomSheet((context) => 
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200],
                      blurRadius: 15,
                      spreadRadius: 1
                    )
                  ],
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      defaultTextbox(
                        controller: titleController,
                        prefixIcon: Icons.title,
                        labelText: "Task Title",
                        validate: (String value)
                        {
                          if(value.isEmpty)
                            return "title must not be empty";
                          else 
                            return null;
                        }
                      ),
                      SizedBox(height: 10,),
                      defaultTextbox(
                        controller: timeController,
                        prefixIcon: Icons.watch_later_outlined,
                        labelText: "Task Time",
                        keyboardType: TextInputType.datetime,
                        onTap: () async
                        {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now()
                          ).then((value)
                          {
                            timeController.text = value.format(context).toString();
                          });
                        },
                        validate: (String value)
                        {
                          if(value.isEmpty)
                            return "time must not be empty";
                          else 
                            return null;
                        }
                      ),
                      SizedBox(height: 10,),
                      defaultTextbox(
                        controller: dateController,
                        prefixIcon: Icons.calendar_today,
                        labelText: "Task Date",
                        keyboardType: TextInputType.datetime,
                        onTap: () async
                        {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.parse("2021-8-18"),
                          ).then((value) 
                          {
                            dateController.text = DateFormat.yMMMd().format(value);
                          });
                        },
                        validate: (String value)
                        {
                          if(value.isEmpty)
                            return "date must not be empty";
                          else 
                            return null;
                        }
                      ),
                      SizedBox(height: 10,),
                      defaultButton(
                        text: "Done",
                        onPressed:()
                        {
                          if(formKey.currentState.validate()){
                            Navigator.pop(context);
                            setState(() {
                              isBottomSheetShown = false;
                            });
                          }
                        }
                      )
                    ],
                  ),
                ),
              )
            );
            setState(() {
              isBottomSheetShown = true;
            });
          }
          
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          transform: isBottomSheetShown ? Matrix4.rotationZ(15) : Matrix4.rotationZ(0),
          transformAlignment: FractionalOffset.center,
          child: Icon(
            Icons.add
          )
        ),
      ),
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

  void createDb() async{
    db = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (db,version){
        db.execute("CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)")
        .then((value){
            print("table created");
          }
        )
        .catchError((onError){
          print("${onError.toString()}");
        })
        ;
      },
      onOpen: (db){
        print("table open");
      }
    );
  }

  void createTask(){
    db.transaction((txn)
    {
      txn.rawInsert('INSERT INTO tasks(title,date,time,status) VALUES("first task","02222","891","new")')
        .then((value) 
        {
          print("${value.toString()} inserted successfully");
        })
        .catchError((onError)
        {
          print("inserted error");
        });

      return null;
    });
  }
}