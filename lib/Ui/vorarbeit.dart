// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: DrawerOE(),
//     );
//   }
// }

// class DrawerOE extends StatefulWidget {
//   const DrawerOE({Key key, this.restorationId}) : super(key: key);

//   final String restorationId;
//   @override
//   _DrawerOEState createState() => _DrawerOEState();
// }

// class _DrawerOEState extends State<DrawerOE> with RestorationMixin {
//   final RestorableInt _currentIndex = RestorableInt(0);
//   @override
//   Widget build(BuildContext context) {
//     final drawerElements = ListView(
//       children: [
//         UserAccountsDrawerHeader(
//           accountName: Text("Okan"),
//           accountEmail: Text("Okan@info.de"),
//           currentAccountPicture: const CircularProgressIndicator(
//             backgroundColor: Colors.white,
//           ),
//         ),
//         ListTile(
//           title: Text("Kalender"),
//           onTap: () {
//             Navigator.pop(context);
//           },
//         ),
//         Divider(),
//         ListTile(
//           title: Text("Workspaces"),
//           onTap: () {},
//         ),
//       ],
//     );
//     var bottomNavigationBarItems = [
//       BottomNavigationBarItem(
//         icon: const Icon(Icons.account_box),
//         label: "Accont",
//       ),
//       BottomNavigationBarItem(
//         icon: const Icon(Icons.access_alarm),
//         label: "Alarm",
//       ),
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Drawer Title"),
//       ),
//       body: Center(
//         child: InkWell(
//           onTap: () {
//             print("syso");
//           },
//           child: Center(
//               child: _MyBottomNavView(
//                   key: UniqueKey(),
//                   item: bottomNavigationBarItems[_currentIndex.value])),
//         ),
//       ),
//       drawer: Drawer(
//         child: drawerElements,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         showUnselectedLabels: false,
//         items: bottomNavigationBarItems,
//         currentIndex: _currentIndex.value,
//         onTap: (index) {
//           setState(() {
//             _currentIndex.value = index;
//           });
//         },
//       ),
//     );
//   }

//   @override
//   // TODO: implement restorationId
//   String get restorationId => widget.restorationId;

//   @override
//   void restoreState(RestorationBucket oldBucket, bool initialRestore) {
//     // TODO: implement restoreState
//     registerForRestoration(_currentIndex, 'bottom_navigation_tab_indec');
//   }
// }

// class _MyBottomNavView extends StatelessWidget {
//   _MyBottomNavView({Key key, this.item}) : super(key: key);
//   final BottomNavigationBarItem item;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Text(item.label);
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     //fragen ob die with besser geholt werden kann da aktuell in eine globale var geschrieben wird
//     setwidth(MediaQuery.of(context).size.width);
//     return Scaffold(
//         body: Center(
//       child: scaffoldcontentOE,
//     ));
//   }
// }

// var scaffoldcontentOE = Container(
//   child: Center(
//     //fragen warum man bei manchen childen <Widget> [...] macht, was ist besser ?
//     child: Wrap(
//       children: [
//         Align(
//           alignment: Alignment.center,
//           child: toprow,
//         ),
//         Divider(),
//         horizontalscroll,
//         calender,
//         Divider(),
//         iconRow
//       ],
//     ),
//   ),
// );

// var gridmaker = CustomScrollView(
//   primary: false,
//   slivers: <Widget>[
//     SliverPadding(
//       padding: const EdgeInsets.all(50),
//       sliver: SliverGrid.count(
//         crossAxisCount: 2,
//         //mainAxisSpacing: 10,
//         crossAxisSpacing: 10,
//         //padding: const EdgeInsets.all(20),
//         children: [
//           Container(
//             color: Colors.red,
//           ),
//           Container(
//             color: Colors.blue,
//           ),
//         ],
//       ),
//     )
//   ],
// );

// var toprow = Container(
//   padding: EdgeInsets.only(bottom: 10.0),
//   color: Colors.red,
//   width: getwidth() * 0.9,
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Column(
//         children: [
//           Text("Hallo"),
//           Container(
//             height: 100.00,
//             color: Colors.blue,
//             width: 100.00,
//           ),
//         ],
//       ),
//       Column(
//         children: [
//           Text("Welt"),
//           Container(
//             height: 100.00,
//             padding: const EdgeInsets.all(10.00),
//             color: Colors.black,
//             width: 100.00,
//           )
//         ],
//       ),
//     ],
//   ),
// );

// var horizontalscroll = SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: Wrap(
//     spacing: 10,
//     children: [
//       Container(
//         height: 120.00,
//         color: Colors.yellow,
//         child: Text("test"),
//       ),
//       Container(
//         height: 120.00,
//         color: Colors.yellow,
//         child: Text("test"),
//       ),
//       Container(
//         height: 120.00,
//         color: Colors.yellow,
//         child: Text("test"),
//       ),
//       Container(
//         height: 120.00,
//         width: 120.00,
//         color: Colors.yellow,
//         child: Text("test"),
//       ),
//       Container(
//         height: 120.00,
//         width: 1200.00,
//         color: Colors.yellow,
//         child: Text("test"),
//       ),
//       Container(
//         height: 120.00,
//         width: 120.00,
//         color: Colors.yellow,
//         child: Text("test"),
//       ),
//       Container(
//         height: 120.00,
//         width: 1200.00,
//         color: Colors.yellow,
//         child: Text("test"),
//       ),
//     ],
//   ),
// );

// var calender = Container(
//   width: widthO * 0.9,
//   child: Column(
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text("M"),
//           Text("D"),
//           Text("M"),
//           Text("D"),
//           Text("F"),
//           Text("S"),
//           Text("S"),
//         ],
//       ),
//     ],
//   ),
// );

// var iconRow = Column(
//   children: [
//     Image(
//       image: NetworkImage(
//           'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
//     ),
//     Container(
//       padding: const EdgeInsets.all(32),
//       child: Row(
//         //mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [Text("test"), Text("test2")],
//             ),
//           ),
//           Icon(
//             Icons.star,
//             color: Colors.red,
//           ),
//           Text("41"),
//         ],
//       ),
//     ),
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       //mainAxisSize: MainAxisSize.min,
//       // child: null,
//       children: [
//         Column(
//           children: [
//             Icon(
//               Icons.call,
//               color: Colors.red,
//             ),
//             Container(
//               // command + shift + p // devtools
//               child: Text(
//                 "Call",
//                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
//               ),
//             ),
//           ],
//         ),
//         Column(
//           children: [
//             Icon(
//               Icons.router,
//               color: Colors.red,
//             ),
//             Divider(),
//             Text("Router")
//           ],
//         ),
//         Column(
//           children: [
//             Icon(
//               Icons.calendar_today,
//               color: Colors.red,
//             ),
//             Divider(),
//             Text("Callendar")
//           ],
//         )
//       ],
//     ),
//     Container(
//       child: Text("oasnsdbioabvasuhfbasuvbavoa"),
//     )
//   ],
// );

// //-- width setzen
// double widthO;
// void setwidth(double widthOE) {
//   widthO = widthOE;
// }

// double getwidth() {
//   return widthO;
// }

// ///
// ///
// ///
// ///import 'dart:html';
// import 'dart:math';
// import 'package:taskkaptan/models/dummydaten.dart';

// import 'models/task.dart';
// import 'models/workspace.dart';
// import 'Ui/taskpage.dart';
// import 'package:taskkaptan/widgets/drawer_widget.dart';
// import 'package:flutter/material.dart';

// final navigatorKey = GlobalKey<NavigatorState>();
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: TaskHome(),
//       navigatorKey: navigatorKey,
//     );
//   }
// }

// class TaskHome extends StatefulWidget {
//   @override
//   _TaskHomeState createState() => _TaskHomeState();
// }

// class _TaskHomeState extends State<TaskHome> {
//   List<Workspace> wsList = [];

//   void addWorkspaceIcon(String titelWs) {
//     setState(() {
//       Workspace wsneu = Workspace(
//           wsIcon: Icon(
//             Icons.access_alarm,
//           ),
//           wsTitel: titelWs);
//       wsList.add(wsneu);
//     });
//     Navigator.of(context).pop();
//   }

//   void addWorkspace() {
//     // final rootContext =
//     //     context.findRootAncestorStateOfType<NavigatorState>().context;
//     showDialog<AlertDialog>(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             content: TextField(
//               onSubmitted: addWorkspaceIcon,
//             ),
//           );
//         });
//   }

//   void showWSOverview() {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 40,
//         flexibleSpace: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(),
//             Column(
//               children: [
//                 IconButton(
//                     icon: Icon(Icons.add_circle_outline), onPressed: () {}),
//               ],
//             ),
//             Column(
//               children: [
//                 IconButton(icon: Icon(Icons.search), onPressed: () {})
//               ],
//             )
//           ],
//         ),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Expanded(
//               flex: 1,
//               child: InkWell(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (BuildContext context) => Taskgen()));
//                 },
//                 child: Container(
//                   color: Colors.yellow,
//                   child: Row(
//                     children: [],
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 color: Colors.red,
//                 child: Column(
//                   children: [
//                     Text("HalloHome"),
//                     IconButton(
//                         icon: Icon(Icons.forward),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (BuildContext context) =>
//                                       KalenderPage()));
//                         }),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 color: Colors.blue,
//                 child: Column(
//                   children: [
//                     Text("HalloTask"),
//                     IconButton(
//                         icon: Icon(Icons.forward),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (BuildContext context) =>
//                                       TaskPage()));
//                         }),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       drawer: buildDrawer(),
//       floatingActionButton: FloatingActionButton(
//         child: IconButton(icon: Icon(Icons.add), onPressed: () => print("ok")),
//       ),
//     );
//   }

//   Widget buildDrawer() => DrawerWidget();
// }

// class KalenderPage extends StatefulWidget {
//   @override
//   _KalenderPageState createState() => _KalenderPageState();
// }

// class _KalenderPageState extends State<KalenderPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             Text("KalenderPage"),
//             IconButton(
//                 icon: Icon(Icons.backspace),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TaskPage extends StatefulWidget {
//   @override
//   _TaskPageState createState() => _TaskPageState();
// }

// class _TaskPageState extends State<TaskPage> {
//   var tasklist = ["Task1", "Task2", "Task3"];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ListView.builder(
//       itemCount: tasklist.length,
//       itemBuilder: (context, i) {
//         return;
//       },
//     ));
//   }
// }
