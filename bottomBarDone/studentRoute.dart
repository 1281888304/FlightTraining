import 'package:flutter/material.dart';
import 'main.dart';
import 'studentHome.dart';
//class ViewStudentRoute extends StatelessWidget {
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: Text('Student Page'),
//   //       leading: new IconButton(
//   //         icon: new Icon(Icons.arrow_back),
//   //         onPressed: () {
//   //           Navigator.push(
//   //             context,
//   //             MaterialPageRoute(builder: (context) => MyHomePage()),
//   //           );
//   //         },
//   //       ),
//   //       backgroundColor: Colors.green,
//   //     ),
//   //     body: Center(
//   //         child: Column(children: <Widget>[
//   //           RaisedButton(
//   //             child: Text(
//   //               'View Lessons!',
//   //               style: Theme.of(context).textTheme.headline6,
//   //             ),
//   //             onPressed: () {
//   //               Navigator.pushNamed(context, '/studentDetail');
//   //             },
//   //           ),
//   //       RaisedButton(
//   //         child: Text(
//   //           'View Requirements!',
//   //           style: Theme.of(context).textTheme.headline6,
//   //         ),
//   //         onPressed: () {
//   //           Navigator.pushNamed(context, '/requirement');
//   //         },
//   //       ),
//   //       RaisedButton(
//   //         child: Text(
//   //           'View Endorsements',
//   //           style: Theme.of(context).textTheme.headline6,
//   //         ),
//   //         onPressed: () {
//   //           Navigator.pushNamed(context, '/viewEndorsements');
//   //         },
//   //       ),
//   //       RaisedButton(
//   //         child: Text(
//   //           'View Grade',
//   //           style: Theme.of(context).textTheme.headline6,
//   //         ),
//   //         onPressed: () {
//   //           Navigator.pushNamed(context, '/viewGrade');
//   //         },
//   //       ),
//   //           RaisedButton(
//   //             child: Text(
//   //               'Request a Lesson',
//   //               style: Theme.of(context).textTheme.headline6,
//   //             ),
//   //             onPressed: () {
//   //               Navigator.pushNamed(context, '/schedule');
//   //             },
//   //           ),
//   //     ])),
//   //   );
//   // }
// }
class ViewStudentRoute extends StatefulWidget {
  @override
  _ViewStudentRouteState createState() => _ViewStudentRouteState();
}

class _ViewStudentRouteState extends State<ViewStudentRoute> {

  int _currentIndex=0;
  final List<Widget> _children=
  [
    MyApp(),
    StudentDetailRoute(),
    RequirementRoute(),
    EndorsementsRoute(),
    GradeRoute(),
    ScheduleRoute(),
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey,
        iconSize: 40,
        selectedFontSize: 10,
        items:[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              title: Text("Home"),
              backgroundColor: Colors.blueGrey
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text("Lesson"),
              backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.agriculture),
              title: Text("Requirement"),
              backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              title: Text("Endorsment"),
              backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.grade),
              title: Text("Grade"),
              backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range),
              title: Text("RequestLesson"),
              backgroundColor: Colors.green
          )
        ],
        // onTap: (index){
        //   setState(() {
        //     _currentIndex=index;
        //   });
        // },
      ),
    );
  }
}
