import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Forms(),
    ),
  );
}

class Forms extends StatefulWidget {
  @override
  Input createState() => Input();
}

class Input extends State<Forms> {
  double _sliderval = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Center(child: Text('Lessons')),
        backgroundColor: Colors.blueGrey,
      ),
      body: new SafeArea(
        child: new Form(
          child: new ListView(children: <Widget>[
            new TextFormField(
              decoration: InputDecoration(labelText: 'Lesson #: '),
            ),
            new TextFormField(
              decoration: InputDecoration(labelText: 'Instructor : '),
            ),
            new TextFormField(
              decoration: InputDecoration(labelText: 'Student Name : '),
            ),
            new TextFormField(
              decoration: InputDecoration(labelText: 'Aircraft Type : '),
            ),
            new TextFormField(
              decoration: InputDecoration(labelText: 'Aircraft Identification : '),
            ),
            new TextFormField(
              decoration: InputDecoration(labelText: 'Route Name : '),
            ),
            new TextFormField(
              decoration: InputDecoration(labelText: 'Flight Time : '),
            ),
            new TextFormField(
              decoration: InputDecoration(labelText: 'Ground Time : '),
            ),
            new Container(
                padding: const EdgeInsets.only(top: 20.0),
                child: new RaisedButton(
                  child: const Text('Create Lesson'),
                  onPressed: () {},
                )),
          ]),
        ),
      ),
    );
  }
}
