import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Task {
  String taskID = "";
  String taskTitel = "";
  String taskDescription = "";

  var uuid = Uuid();

  void initTask(String taskTitel, String description) {
    this.taskID = uuid.v1();
    this.taskTitel = taskTitel;
    this.taskDescription = description;
  }

  void setTask(String taskTitel, String description) {
    this.taskTitel = taskTitel;
    this.taskDescription = taskDescription;
  }

  Task gettast() {
    return Task("o", "o");
  }

  Task(this.taskTitel, this.taskDescription) {
    setTask(taskTitel, taskDescription);
  }
}
