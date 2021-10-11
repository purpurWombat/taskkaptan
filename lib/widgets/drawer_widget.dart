import 'package:flutter/material.dart';
import 'package:taskkaptan/models/workspace.dart';
import 'package:taskkaptan/models/dummydaten.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  List<Workspace> allWSlist = DummyWS().getWS;
  Workspace aktuellChoosenWS = DummyWS().getWS.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      child: Drawer(
        child: Container(
            width: 100.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: allWSlist.length,
                      itemBuilder: (context, index) {
                        return IconButton(
                          icon: allWSlist[index].wsIcon,
                          onPressed: () => setState(() {
                            aktuellChoosenWS = allWSlist[index];
                          }),
                        );
                      }),
                ),
                const SizedBox(
                  width: 25,
                ),
                (() {
                  if (aktuellChoosenWS.wsTitel == "HOME") {
                    return Container(
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(aktuellChoosenWS.wsTitel),
                          )
                        ],
                      ),
                    );
                  } else if (aktuellChoosenWS.wsTitel == "ADD") {
                    return Container(
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(aktuellChoosenWS.wsTitel),
                          ),
                          Icon(Icons.add)
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 10.0,
                            width: 10.0,
                            color: Colors.orange,
                          ),
                          Container(
                            child: Text(aktuellChoosenWS.wsTitel),
                          ),
                        ],
                      ),
                    );
                  }
                }()),
              ],
            )),
      ),
    );
  }
}
