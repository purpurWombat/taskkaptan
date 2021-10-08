import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: TaskHome(),
    );
  }
}

class TaskHome extends StatefulWidget {
  @override
  _TaskHomeState createState() => _TaskHomeState();
}

class _TaskHomeState extends State<TaskHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(),
            Column(
              children: [
                IconButton(
                    icon: Icon(Icons.add_circle_outline), onPressed: () {}),
              ],
            ),
            Column(
              children: [
                IconButton(icon: Icon(Icons.search), onPressed: () {})
              ],
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Taskgen()));
                },
                child: Container(
                  color: Colors.yellow,
                  child: Row(
                    children: [],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                child: Column(
                  children: [
                    Text("HalloHome"),
                    IconButton(
                        icon: Icon(Icons.forward),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      KalenderPage()));
                        }),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    Text("HalloTask"),
                    IconButton(
                        icon: Icon(Icons.forward),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      TaskPage()));
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Container(
        width: 200.0,
        child: Drawer(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50.0, //ohne width gibt es einen fehler
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    IconButton(icon: Icon(Icons.home), onPressed: () {}),
                    Divider(),
                    Divider(),
                    IconButton(icon: Icon(Icons.add), onPressed: () {}),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("ok")],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: IconButton(icon: Icon(Icons.add), onPressed: () => print("ok")),
      ),
    );
  }
}

class KalenderPage extends StatefulWidget {
  @override
  _KalenderPageState createState() => _KalenderPageState();
}

class _KalenderPageState extends State<KalenderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text("KalenderPage"),
            IconButton(
                icon: Icon(Icons.backspace),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var tasklist = ["Task1", "Task2", "Task3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: tasklist.length,
      itemBuilder: (context, i) {
        return;
      },
    ));
  }
}

class Taskgen extends StatefulWidget {
  @override
  _TaskgenState createState() => _TaskgenState();
}

class _TaskgenState extends State<Taskgen> {
  // final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
  Map<String, String> tasks = {"1": "Task1", "2": "Task2"};

  void addTaskTile(String item) {
    setState(() {
      tasks[item] = "ok";
    });
    Navigator.of(context).pop();
  }

  void deleteTask(String key) {
    setState(() {
      tasks.remove(key);
    });
  }

  void addTask() {
    showDialog<AlertDialog>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: TextField(
              onSubmitted: addTaskTile,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            String key = tasks.keys.elementAt(index);
            print(index);

            return TaskTileCustom(key, tasks[key], () => deleteTask(key));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: Icon(Icons.add),
      ),
    );
  }
}

// Dismissible(
//               key: Key(item),
//               child: ListTile(
//                 leading: Checkbox(
//                   value: false,
//                 ),
//                 title: Text(item),
//                 subtitle: Text("okay"),
//                 isThreeLine: true,
//                 trailing: Icon(Icons.delete),
//               ),
//             );

class TaskTileCustom extends StatefulWidget {
  //TaskTileCustom({Key key, this.desc, this.deletetask}) : super(key: key);
  TaskTileCustom(this.title, this.desc, this.deletetask);
  String title;
  String desc;
  Function deletetask;

  @override
  _TaskTileCustomState createState() => _TaskTileCustomState();
}

class _TaskTileCustomState extends State<TaskTileCustom> {
  String title;
  String description;

  @override
  void updateTask(titleUpdate, descriptionUpdate) {
    setState(() {
      title = titleUpdate;
      description = descriptionUpdate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Row(
        children: [
          Column(
            children: [Text(widget.title), Text(widget.desc)],
          ),
          IconButton(
              icon: Icon(Icons.delete), onPressed: () => widget.deletetask())
        ],
      ),
    );
  }
}
