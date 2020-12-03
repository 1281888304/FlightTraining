import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {


  TextEditingController controllerLesson = new TextEditingController();
  TextEditingController controllerTime = new TextEditingController();
  TextEditingController controllerStudent = new TextEditingController();
  TextEditingController controllerRoute = new TextEditingController();
  TextEditingController controllerStages = new TextEditingController();
  TextEditingController controllerFlightTime = new TextEditingController();
  TextEditingController controllerGroundTime = new TextEditingController();
  TextEditingController controllerLanding = new TextEditingController();
  TextEditingController controllerGrade = new TextEditingController();

  void addData(){
    var url="https://qzhang.greenriverdev.com/305/FlutterTest1/addClass.php";

    http.post(url, body: {
      "lessonName": controllerLesson.text,
      "time": controllerTime.text,
      "student": controllerStudent.text,
      "route": controllerRoute.text,
      "stages": controllerStages.text,
      "flightTime": controllerFlightTime.text,
      "groundTime": controllerGroundTime.text,
      "Landing": controllerLanding.text,
      "grade": controllerGrade.text,

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ADD DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerLesson,
                  decoration: new InputDecoration(
                      hintText: "Lesson Name", labelText: "Lesson Name"),
                ),
                new TextField(
                  controller: controllerTime,
                  decoration: new InputDecoration(
                      hintText: "Date of Time", labelText: "Date of Time"),
                ),
                new TextField(
                  controller: controllerStudent,
                  decoration: new InputDecoration(
                      hintText: "Student Name", labelText: "Student Name"),
                ),
                new TextField(
                  controller: controllerRoute,
                  decoration: new InputDecoration(
                      hintText: "Route", labelText: "Route"),
                ),
                new TextField(
                  controller: controllerLanding,
                  decoration: new InputDecoration(
                      hintText: "Landing", labelText: "Landing"),
                ),
                new TextField(
                  controller: controllerStages,
                  decoration: new InputDecoration(
                      hintText: "Stages", labelText: "Stages"),
                ),
                new TextField(
                  controller: controllerFlightTime,
                  decoration: new InputDecoration(
                      hintText: "Flight Time", labelText: "Flight Time"),
                ),
                new TextField(
                  controller: controllerGroundTime,
                  decoration: new InputDecoration(
                      hintText: "Ground Time", labelText: "Ground Time"),
                ),
                new TextField(
                  controller: controllerGrade,
                  decoration: new InputDecoration(
                      hintText: "Grade", labelText: "Grade"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("ADD DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    addData();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}