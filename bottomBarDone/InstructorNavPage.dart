import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addclass.dart';
import 'main.dart';
class InstructorHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instructor Home'),
    leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
        ),
      ),
      body: Container(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'This is the Instructors homepage, here you can edit, view, or create a lesson for your students.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Image.asset('assets/logo.jpg'),
                  ]))),
    );
  }
}

class ViewInstructorRoute extends StatefulWidget {
  @override
  _ViewInstructorRouteState createState() => _ViewInstructorRouteState();
}

class _ViewInstructorRouteState extends State<ViewInstructorRoute> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    InstructorHome(),
    CreateLesson(),
    ViewStudentDetailRoute(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
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
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              title: Text("Create a Lesson"),
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_page),
              title: Text("Lesson"),
              backgroundColor: Colors.green),
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