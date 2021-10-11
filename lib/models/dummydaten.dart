import 'package:flutter/material.dart';
import 'package:taskkaptan/models/workspace.dart';

class DummyWS {
  List<Workspace> getWS = [
    Workspace(wsIcon: Icon(Icons.home), wsTitel: "HOME"),
    Workspace(wsIcon: Icon(Icons.access_alarm), wsTitel: "AlarmWS"),
    Workspace(wsIcon: Icon(Icons.radio), wsTitel: "RADIO"),
    Workspace(wsIcon: Icon(Icons.backpack), wsTitel: "BACKPACK"),
    Workspace(wsIcon: Icon(Icons.hardware), wsTitel: "HARDWARE"),
    Workspace(wsIcon: Icon(Icons.offline_bolt), wsTitel: "OFFLINE BOLD"),
    Workspace(wsIcon: Icon(Icons.add), wsTitel: "ADD")
  ];
}
