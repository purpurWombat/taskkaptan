import 'dart:html';
import 'dart:math';
import 'package:taskkaptan/models/dummydaten.dart';

import 'models/task.dart';
import 'models/workspace.dart';
import 'Ui/taskpage.dart';
import 'package:taskkaptan/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();
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
      navigatorKey: navigatorKey,
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
                    IconButton(icon: Icon(Icons.forward), onPressed: () {}),
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
                    IconButton(icon: Icon(Icons.forward), onPressed: () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: buildDrawer(),
      floatingActionButton: FloatingActionButton(
        child: IconButton(icon: Icon(Icons.add), onPressed: () => print("ok")),
      ),
    );
  }

  Widget buildDrawer() => DrawerWidget();
}
