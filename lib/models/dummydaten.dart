import 'package:flutter/material.dart';
import 'package:taskkaptan/models/workspace.dart';

class DummyWS {
  List<Workspace> getWS() {
    Workspace wsTest1 =
        new Workspace(wsIcon: Icon(Icons.home), wsTitel: "HOME");
    Workspace wsTest2 =
        new Workspace(wsIcon: Icon(Icons.access_alarm), wsTitel: "AlarmWS");

    Workspace wsTest3 =
        new Workspace(wsIcon: Icon(Icons.radio), wsTitel: "RADIO");
    Workspace wsTest4 =
        new Workspace(wsIcon: Icon(Icons.backpack), wsTitel: "BACKPACK");

    Workspace wsTest5 =
        new Workspace(wsIcon: Icon(Icons.hardware), wsTitel: "HARDWARE");
    Workspace wsTest6 = new Workspace(
        wsIcon: Icon(Icons.offline_bolt), wsTitel: "OFFLINE BOLD");

    Workspace wsTest9 = new Workspace(wsIcon: Icon(Icons.add), wsTitel: "ADD");

    List<Workspace> allWS = [
      wsTest1,
      wsTest2,
      wsTest3,
      wsTest4,
      wsTest2,
      wsTest5,
      wsTest6,
      wsTest9
    ];

    return allWS;
  }
}
