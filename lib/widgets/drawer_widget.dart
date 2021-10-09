import 'dart:html';

import 'package:flutter/material.dart';
import 'package:taskkaptan/models/workspace.dart';
import 'package:taskkaptan/models/dummydaten.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  List<Workspace> allWSlist = DummyWS().getWS();
  Workspace aktuellChoosenWS;

  @override
  void initState() {
    aktuellChoosenWS = allWSlist.first;
  }

  chooseWS(Workspace e) {
    setState(() {
      aktuellChoosenWS = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      child: Drawer(
        child: Container(width: 100.0, child: buildDrawerWS(context)),
      ),
    );
  }

  Widget buildDrawerWS(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 50.00,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: allWSlist.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        IconButton(
                          icon: allWSlist[index].wsIcon,
                          onPressed: () => chooseWS(allWSlist[index]),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
        //overviewWSWidget(aktuellChoosenWS),
        overviewWSfunktionChoose(aktuellChoosenWS),
      ],
    );
  }

  overviewWSfunktionChoose(Workspace ws) {
    if (ws.wsTitel == "HOME") {
      return overviewWSWidgetHome(ws);
    } else if (ws.wsTitel == "ADD") {
      return overviewWSWidgetADD(ws);
    } else {
      return overviewWSWidgetWS(ws);
    }
  }

  Widget overviewWSWidgetHome(Workspace aktuellWS) {
    return Expanded(
        child: Column(
      children: [
        Container(
          child: Text(aktuellWS.wsTitel),
        )
      ],
    ));
  }

  Widget overviewWSWidgetADD(Workspace aktuellWS) {
    return Expanded(
        child: Column(
      children: [
        Container(
          child: Text(aktuellWS.wsTitel),
        ),
        Icon(Icons.add)
      ],
    ));
  }

  Widget overviewWSWidgetWS(Workspace aktuellWS) {
    return Expanded(
        child: Column(
      children: [
        Container(
          height: 10.0,
          width: 10.0,
          color: Colors.orange,
        ),
        Container(
          child: Text(aktuellWS.wsTitel),
        ),
      ],
    ));
  }
}
