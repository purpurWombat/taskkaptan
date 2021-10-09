import 'dart:html';
import 'dart:math';
import 'package:taskkaptan/models/dummydaten.dart';

import 'models/task.dart';
import 'models/workspace.dart';
import 'Ui/taskpage.dart';
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
  List<Workspace> wsList = [];

  void addWorkspaceIcon(String titelWs) {
    setState(() {
      Workspace wsneu = Workspace(
          wsIcon: Icon(
            Icons.access_alarm,
          ),
          wsTitel: titelWs);
      wsList.add(wsneu);
    });
    Navigator.of(context).pop();
  }

  void addWorkspace() {
    // final rootContext =
    //     context.findRootAncestorStateOfType<NavigatorState>().context;
    showDialog<AlertDialog>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: TextField(
              onSubmitted: addWorkspaceIcon,
            ),
          );
        });
  }

  void showWSOverview() {
    setState(() {});
  }

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
      drawer: buildDrawer(),
      floatingActionButton: FloatingActionButton(
        child: IconButton(icon: Icon(Icons.add), onPressed: () => print("ok")),
      ),
    );
  }

  Widget buildDrawer() => DrawerWidget();
}

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      child: Drawer(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 50.0, //ohne width gibt es einen fehler
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      IconButton(icon: Icon(Icons.home), onPressed: () {}),
                      Divider(),
                      Divider(),
                      IconButton(icon: Icon(Icons.add), onPressed: () => {}),
                    ],
                  ),
                ),
                IconButton(icon: Icon(Icons.add), onPressed: () => {}),
              ],
            ),
            Container(width: 100.0, child: buildDrawerWS(context)),
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
    );
  }

  Widget buildDrawerWS(BuildContext context) {
    List<Workspace> allWSlist = DummyWS().getWS();
    return Column(
        children: allWSlist
            .map((e) => ListTile(
                    title: Text(
                  e.wsTitel,
                )))
            .toList());
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
