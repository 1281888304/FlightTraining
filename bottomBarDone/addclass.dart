import 'dart:ui';

import 'package:flutter/material.dart';
import 'main.dart';
void main() => runApp(CreateLesson());

class CreateLesson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Create Lesson';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewInstructorRoute()),
              );
            },
          ),
        ),

        body: CreateLessonForm(),
      ),
    );
  }
}

class CreateLessonForm extends StatefulWidget {
  @override
  CreateForm createState() {
    return CreateForm();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class CreateForm extends State<CreateLessonForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  bool savedAir = false;
  bool savedIden = false;
  bool savedRoute = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int _value = 0;

    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: ListView(children: <Widget>[
          // The validator receives the text that the user has entered.
          TextFormField(
            decoration: InputDecoration(labelText: 'Date/Time: '),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter date.';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Instructor : '),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Student Name : '),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: DropdownButtonFormField(
                      decoration: InputDecoration(labelText: 'Aircraft Type: '),
                      items: [
                        DropdownMenuItem(
                          child: Text('E-127'),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text('S-123'),
                          value: 2,
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Center(
                    child: Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CheckboxListTile(
                            title: Text(
                                "Use an aircraft that you've saved to your account"),
                            checkColor: Colors.greenAccent,
                            activeColor: Colors.red,
                            value: this.savedAir,
                            onChanged: (value) {
                              setState(() {
                                savedAir = value;
                              });
                            }),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Row(children: [
            Expanded(
              child: Container(
                child: DropdownButtonFormField(
                    decoration:
                    InputDecoration(labelText: 'Aircraft Identification: '),
                    items: [
                      DropdownMenuItem(
                        child: Text('N480E'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('A598Z'),
                        value: 2,
                      )
                    ],
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    }),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Center(
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CheckboxListTile(
                          title: Text(
                              "Use an aircraft identification that you've saved to your account"),
                          checkColor: Colors.greenAccent,
                          activeColor: Colors.red,
                          value: this.savedIden,
                          onChanged: (value) {
                            setState(() {
                              savedIden = value;
                            });
                          }),
                    ),
                  ),
                ),
              ),
            )
          ]),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Route Name : '),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Center(
                    child: Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CheckboxListTile(
                            title: Text(
                                "Use a route that you've saved to your account"),
                            checkColor: Colors.greenAccent,
                            activeColor: Colors.red,
                            value: this.savedRoute,
                            onChanged: (value) {
                              setState(() {
                                savedRoute = value;
                              });
                            }),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            child: DropdownButtonFormField(
                decoration:
                InputDecoration(labelText: 'Stages: '),
                items: [
                  DropdownMenuItem(
                    child: Text('Stage I: Pre Solo and Solo'),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text('Stage II: Night Flight and Cross-Country Flight'),
                    value: 2,
                  ),DropdownMenuItem(
                    child: Text('Stage III: Test Preparation'),
                    value: 3,
                  ),
                  DropdownMenuItem(
                    child: Text('Aeronautical Knowledge'),
                    value: 4,
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                }),
          ),

          TextFormField(
            decoration: InputDecoration(labelText: 'Flight Time : '),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Ground Time : '),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Day Takeoffs : '),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Day Landings : '),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Night Takeoffs : '),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Night Landings : '),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          new TextFormField(
            maxLines: 5,
            decoration: InputDecoration(labelText: "Lesson Notes::"),
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {}
              },
              child: Text('Save Lesson'))
        ]));
  }
}