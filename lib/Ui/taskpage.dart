import 'package:flutter/material.dart';
import 'package:taskkaptan/models/task.dart';
import 'package:taskkaptan/models/workspace.dart';

class Taskgen extends StatefulWidget {
  @override
  _TaskgenState createState() => _TaskgenState();
}

class _TaskgenState extends State<Taskgen> {
  // final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
  Map<String, String> tasks = {"1": "Task1", "2": "Task2"};
  void testTaskObject() {
    Task taskokay = new Task("o", "o");
    print("Task Test:");
    print(taskokay.taskTitel);
  }

  void addTaskTile(String item) {
    setState(() {
      tasks[item] = "ok";
    });
    testTaskObject();
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
