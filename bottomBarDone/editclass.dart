import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'home.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController controllerLesson = new TextEditingController();
  TextEditingController controllerTime = new TextEditingController();
  TextEditingController controllerStudent = new TextEditingController();
  TextEditingController controllerRoute = new TextEditingController();
  TextEditingController controllerStages = new TextEditingController();
  TextEditingController controllerFlightTime = new TextEditingController();
  TextEditingController controllerGroundTime = new TextEditingController();
  TextEditingController controllerLanding = new TextEditingController();
  TextEditingController controllerGrade = new TextEditingController();


  void editData() {
    var url="https://qzhang.greenriverdev.com/305/FlutterTest1/editclass.php";
    http.post(url,body: {
      "id": widget.list[widget.index]['id'],
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
  void initState() {
    controllerLesson= new TextEditingController(text: widget.list[widget.index]['lessonName'] );
    controllerTime= new TextEditingController(text: widget.list[widget.index]['time'] );
    controllerStudent= new TextEditingController(text: widget.list[widget.index]['student'] );
    controllerRoute= new TextEditingController(text: widget.list[widget.index]['route'] );
    controllerStages= new TextEditingController(text: widget.list[widget.index]['stages'] );
    controllerFlightTime= new TextEditingController(text: widget.list[widget.index]['flightTime'] );
    controllerGroundTime= new TextEditingController(text: widget.list[widget.index]['groundTime'] );
    controllerLanding= new TextEditingController(text: widget.list[widget.index]['Landing'] );
    controllerGrade= new TextEditingController(text: widget.list[widget.index]['grade'] );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT DATA"),
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
                  child: new Text("EDIT DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context)=>new Home()
                        )
                    );
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