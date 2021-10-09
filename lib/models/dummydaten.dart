import 'package:flutter/material.dart';
import 'package:taskkaptan/models/workspace.dart';

class DummyWS {
  List<Workspace> getWS() {
    Workspace wsTest1 =
        new Workspace(wsIcon: Icon(Icons.home), wsTitel: "HOME");
    Workspace wsTest2 =
        new Workspace(wsIcon: Icon(Icons.access_alarm), wsTitel: "AlarmWS");
    Workspace wsTest3 = new Workspace(wsIcon: Icon(Icons.add), wsTitel: "ADD");

    List<Workspace> allWS = [wsTest1, wsTest2, wsTest2, wsTest3];

    return allWS;
  }
}
