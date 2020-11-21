import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
//import 'package:expandable_text/expandable_text.dart';



void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomeRoute(),
      '/viewInstructor': (context) => ViewInstructorRoute(),
      '/viewStudent': (context) => ViewStudentRoute(),

      '/schedule': (context) => ScheduleRoute(),
      '/requirement': (context) => RequirementRoute(),
      '/viewEndorsements': (context) => EndorsementsRoute(),
      '/viewStudentDetail': (context) => ViewStudentDetailRoute(),
      '/studentDetail': (context) => StudentDetailRoute(),
      '/viewGrade': (context) => GradeRoute(),
    },
  ));
}


//home pages with some button to view different
class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skynotes'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Instructor'),
                onPressed: () {
                  Navigator.pushNamed(context, '/viewInstructor');
                },
              ),
              RaisedButton(
                child: Text('Student'),
                onPressed: () {
                  Navigator.pushNamed(context, '/viewStudent');
                },
              ),
            ],
          )),
    );
  }
}

class ScheduleRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule a Lesson"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ScheduleLesson(),
    );
  }
}

//lesson part provide by Aaron for help method
class ScheduleLesson extends StatefulWidget {
  @override
  CreateLForm createState() {
    return CreateLForm();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class CreateLForm extends State<ScheduleLesson> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: ListView(children: <Widget>[
          // The validator receives the text that the user has entered.
          // TextFormField(
          //   decoration: InputDecoration(labelText: 'Date/Time : '),
          //   validator: (value) {
          //     if (value.isEmpty) {
          //       return 'Please enter a date';
          //     }
          //     return null;
          //   },
          // ),
          Text("${selectedDate.toLocal()}".split(' ')[0],
            textAlign: TextAlign.center, style: TextStyle(
                fontSize: 20.0
            ),),
          SizedBox(height: 20.0, width: 10.0,),
          RaisedButton(
            child:
            Text('Select date'),
            // Icon(Icons.date_range,color: Colors.green,),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            onPressed: () => _selectDate(context),
          ),
          new TextFormField(
            decoration: InputDecoration(labelText: 'Students/Pilets : '),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },

          ),
          new TextFormField(
            maxLines: 5,
            decoration: InputDecoration(labelText: "Note:"),
          ),

          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {}
              },
              child: Text('Submit'))
        ]));
  }
}

/*
  done by Qinghang
  a table use function to show the requirement
 */
class RequirementRoute extends StatelessWidget {

  double iconSize = 40.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requirement",
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),

              //old expand method

              child: ExpandableText(
                'In order to apply for a Private Pilot certificate there are requirements that must be met according to FAR Part 61. The requirements are categorized in Part 61 as student and private. Our site allows users to view all requirements for their training program according to FAR Part 61 and track the completion of those requirements. Simply select the student and choose the type of requirement. Expand the chosen requirement to view, click completed and update.',
                trimLines: 1,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Table(
                border: TableBorder.all(),
                columnWidths: {0: FractionColumnWidth(.6), 1: FractionColumnWidth(.2), 2: FractionColumnWidth(.2)},
                children: [
                  TableRow( children: [
                    Column(children:[
                      Icon(Icons.add_location, size: iconSize,
                        color: Colors.blueGrey,),
                      Text('Requirement')
                    ]),
                    Column(children:[
                      Icon(Icons.lightbulb_outline, size: iconSize,color: Colors.lightBlueAccent,),
                      Text('Status')
                    ]),
                    Column(children:[
                      Icon(Icons.access_time_rounded, size: iconSize,color: Colors.deepPurpleAccent,),
                      Text('Completed')
                    ]),
                  ]),
                  TableRow( children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),

                      //old expand method

                      child: ExpandableText(
                        '4.3.1.1 A person who has not held a medical certificate at any point after July 15, 2006 must obtain a medical certificate issued under part 67. The person may choose to use BasicMed even while holding an unexpired medical certificate. After that medical certificate expires, that pilot may use or continue to use BasicMed, provided that person meets the other conditions and limitations.',
                        trimLines: 3,
                      ),
                    ),
                    Icon(Icons.check_circle, size: iconSize,color: Colors.green),
                    Text('  22/12/2020', textScaleFactor:1.0,textAlign: TextAlign.center,),
                  ]),
                  TableRow( children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),

                      //old expand method

                      child: ExpandableText(
                        '4.3.1.1 A person who has not held a medical certificate at any point after July 15, 2006 must obtain a medical certificate issued under part 67. The person may choose to use BasicMed even while holding an unexpired medical certificate. After that medical certificate expires, that pilot may use or continue to use BasicMed, provided that person meets the other conditions and limitations.',
                        trimLines: 3,
                      ),
                    ),
                    Icon(Icons.adjust, size: iconSize,color: Colors.red),
                    Text('  11/12/2020', textScaleFactor:1.0,textAlign: TextAlign.center,),
                  ]),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}

/*
  done by Qinghang
  a data table shows the endorsement
 */
class EndorsementsRoute extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Endorsements",
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: <Widget>[
          ExpandableText(
            'Endorsements are an important part of a student’s flight training program. Our site includes all FAA endorsements that are necessary for student and private pilots in your Private Pilot ASEL certification program. Instructors are responsible for giving and managing their students’ endorsements. Simply choose a student and type of endorsement. Then expand the endorsement to enter the information for the student.',
            trimLines: 3,
          ),
          Text('\n'),
          DataTable(columns: [
            DataColumn(label: Text('Endorsements')),
            DataColumn(label: Text('Status')),
            DataColumn(label: Text('Complete Date')),
          ], rows: [
            DataRow(cells: [
              DataCell(Text('Solo cross-country flight: § 61.93(c)(1) and 61.93(c)(2) - ')),
              DataCell(Icon(Icons.check_circle, size: 20.5,color: Colors.green),),
              DataCell(Text('11/12/2020')),
            ]),
            DataRow(cells: [
              DataCell(Text('Pre-solo aeronautical knowledge: § ')),
              DataCell(Icon(Icons.adjust, size: 20.5,color: Colors.red),),
              DataCell(Text('N/A')),
            ]),
          ])
        ],
      ),
    );
  }

}

/*
  Student detail build by Qinghang,
   view the student detail and connect to the
  detail pages
 */
class ViewStudentDetailRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Student"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: <Widget>[
          DataTable(columns: [
            DataColumn(label: Text('Student Number')),
            DataColumn(label: Text('Students')),
            DataColumn(label: Text('Lesson Detail')),


          ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Aaron')),
                  DataCell(RaisedButton(
                    child: Text('View'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/studentDetail');
                    },
                  ),),

                ]),

                DataRow(cells: [
                  DataCell(Text('2')),
                  DataCell(Text('Austin')),
                  DataCell(Text('view')),

                ]),

                DataRow(cells: [
                  DataCell(Text('3')),
                  DataCell(Text('Arshdeep')),
                  DataCell(Text('view')),

                ]),
              ])
        ],

      ),
    );
  }
}

/*
  The student detail page doing by Arshdeep and Qinghang together
  use the expaand card to provide all the detail for lesson
 */
class StudentDetailRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail for Aaron'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 45.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              ExpansionTile(
                title: Text(
                  'Lesson1',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                children: <Widget>[
                  ExpansionTile(
                    title: Text('Lesson'
                    ),
                    // children: <Widget>[
                    //   ListView( children: <Widget>[
                    //     Text('Lesson'),
                    //     Text('Requirement'),
                    //   ],
                    //   )
                    // ],
                    children: <Widget>[
                      Text('Lesson')
                    ],
                  ),
                  ExpansionTile(title:  Text('Data'),
                    children: <Widget>[
                      Text('15/11/2020')
                    ],
                  ),
                  ExpansionTile(title:  Text('Instructor'),
                    children: <Widget>[
                      Text('Amy')
                    ],
                  ),
                  ExpansionTile(title:  Text('Total Flight time'),
                    children: <Widget>[
                      Text('2 hours')
                    ],
                  ),
                  ExpansionTile(title:  Text('Tasks'),
                    children: <Widget>[
                      Text('1/5')
                    ],
                  ),
                  ExpansionTile(title:  Text('Grade average'),
                    children: <Widget>[
                      Text('N/A')
                    ],
                  )

                ],


              ),


              ExpansionTile(
                title: Text(
                  'Lesson #2',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                children: <Widget>[
                  ExpansionTile(
                    title: Text('class detail',
                      style: TextStyle(fontSize: 23.0),
                    ),
                    // children: <Widget>[
                    //   ListView( children: <Widget>[
                    //     Text('Lesson'),
                    //     Text('Requirement'),
                    //   ],
                    //   )
                    // ],
                    children: <Widget>[
                      ExpansionTile(title:  Text('Data'),
                        children: <Widget>[
                          Text('15/11/2020',style: TextStyle(fontSize: 14.0),)
                        ],
                      ),
                      ExpansionTile(title:  Text('Instructor',style: TextStyle(fontSize: 14.0),),
                        children: <Widget>[
                          Text('Amy')
                        ],
                      ),
                      ExpansionTile(title:  Text('Aircraft Type',style: TextStyle(fontSize: 14.0),),
                        children: <Widget>[
                          Text('CE-172')
                        ],
                      ),
                      ExpansionTile(title:  Text('Aircraft Identification:',style: TextStyle(fontSize: 14.0),),
                        children: <Widget>[
                          Text('N5480E')
                        ],
                      ),
                      ExpansionTile(title:  Text('Rounte name',style: TextStyle(fontSize: 14.0),),
                        children: <Widget>[
                          Text('50')
                        ],
                      )
                    ],
                  ),
                  ExpansionTile(title:  Text('Areas of Operation',style: TextStyle(fontSize: 23.0),),
                    children: <Widget>[
                      ExpansionTile(title:  Text('Stage I: Pre-SOLO AND SOLO'),
                        children: <Widget>[
                          ExpansionTile(title:  Text('Preflight Preparation'),
                            children: <Widget>[
                              Text('50')
                            ],
                          ),
                          ExpansionTile(title:  Text('Basic and Performance Maneuvers'),
                            children: <Widget>[
                              Text('null')
                            ],
                          ),
                          ExpansionTile(title:  Text('Preflight Procedures'),
                            children: <Widget>[
                              Text('null')
                            ],
                          )

                        ],
                      ),

                    ],
                  ),
                  ExpansionTile(title:  Text('Flight Time',style: TextStyle(fontSize: 23.0),),
                    children: <Widget>[
                      Text('Dual Flight Time'),
                      Text('\n'),

                      DataTable(
                        columns: [
                          DataColumn(label: Text('Type')),
                          DataColumn(label: Text('detail')),

                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text("Date")),
                            DataCell(Text('10/13/2020')),

                          ]),
                          DataRow(cells: [
                            DataCell(Text('Night Flight Time')),
                            DataCell(Text('1.3')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Total Flight Time')),
                            DataCell(Text('1.3')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Cross Country Flight Time')),
                            DataCell(Text('1.3')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Instrument(Actual)')),
                            DataCell(Text('1.3')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Instrument(Simulated)')),
                            DataCell(Text('1.3')),
                          ]),

                        ],
                      ),


                    ],
                  ),
                  ExpansionTile(title:  Text('Ground Time',style: TextStyle(fontSize: 23.0),),
                    children: <Widget>[
                      Text('1.0')
                    ],
                  ),
                  ExpansionTile(title:  Text('Lesson Notes',style: TextStyle(fontSize: 23.0),),
                    children: <Widget>[
                      ExpandableText('We will plan on discussing pilot qualifications, airworthiness requirements, preflight of the aircraft, checklist use and cockpit management. We will be doing a thorough preflight of the aircraft that you will be flying throughout your training and using the aircraft checklist! You will do a preflight for every flight lesson and using the aircraft checklists so this ground lesson will help you feel more comfortable with the aircraft, what and why you checking those items and how to check those items! \n'
                        ,trimLines: 3,),
                      Text('\n We will be discussing and performing a preflight check of the aircraft and reviewing the aircraft checklist.')
                      ,
                      InkWell(
                        child: new Text('\n Chapter 6: Ground Reference Maneuvers ',style: TextStyle(color: Colors.blueAccent),),
                        onTap: ()=>launch('https://www.faa.gov/regulations_policies/handbooks_manuals/aviation/airplane_handbook/media/05_afh_ch3.pdf'),
                      )

                    ],
                  ),
                  ExpansionTile(title:  Text('Resources',style: TextStyle(fontSize: 23.0),),
                    children: <Widget>[
                      Text('N/A')
                    ],
                  )

                ],


              ),
            ],



          )
      ),
    );
  }

  launch(String s) {}
}

//Arshdeep's grade class
//view grade route
class GradeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grade"),
        centerTitle: true,

        backgroundColor: Colors.green,
      ),

      body: ListView(
        children: <Widget>[
          DataTable(columns: [
            DataColumn(label: Text('Assignemnts')),
            DataColumn(label: Text('Grades')),


          ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Air worksheet')),
                  DataCell(Text('N/a')),

                ]),

                DataRow(cells: [
                  DataCell(Text('Logs ')),
                  DataCell(Text('N/a')),

                ]),
              ])
        ],

      ),
    );

  }
}

class ViewInstructorRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instructor Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('Schedule a Lesson'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/schedule');
                  },
                ),
                RaisedButton(
                  child: Text('View student for lesson!'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/viewStudentDetail');
                  },
                ),
              ]
          )),
    );
  }
}

class ViewStudentRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('View Requirements!'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/requirement');
                  },
                ),
                RaisedButton(
                  child: Text('View Endorsements for students!'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/viewEndorsements');
                  },
                ),
                RaisedButton(
                  child: Text('View Grade for students!'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/viewGrade');
                  },
                ),
              ]
          )),
    );

  }
}


/*
  there are all the function for readmore factor
  by Qinghang
 */
class ExpandableText extends StatefulWidget {
  const ExpandableText(
      this.text, {
        Key key,
        this.trimLines = 1,
      })  : assert(text != null),
        super(key: key);

  final String text;
  final int trimLines;

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;
  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    final colorClickableText = Colors.blue;
    final widgetColor = Colors.black;
    TextSpan link = TextSpan(
        text: _readMore ? "... read more" : " read less",
        style: TextStyle(
          color: colorClickableText,
        ),
        recognizer: TapGestureRecognizer()..onTap = _onTapLink
    );
    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;
        // Create a TextSpan with data
        final text = TextSpan(
          text: widget.text,
        );
        // Layout and measure link
        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection.rtl,//better to pass this from master widget if ltr and rtl both supported
          maxLines: widget.trimLines,
          ellipsis: '...',
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;
        // Layout and measure text
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;
        // Get the endIndex of data
        int endIndex;
        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));
        endIndex = textPainter.getOffsetBefore(pos.offset);
        var textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: _readMore
                ? widget.text.substring(0, endIndex)
                : widget.text,
            style: TextStyle(
              color: widgetColor,
            ),
            children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(
            text: widget.text,
          );
        }
        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: textSpan,
        );
      },
    );
    return result;
  }
}