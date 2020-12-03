import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'editclass.dart';
// import 'editdata.dart';
import 'home.dart';
// class Detail extends StatefulWidget {
//   List list;
//   int index;
//   Detail({this.index,this.list});
//   @override
//   _DetailState createState() => _DetailState();
// }
//
// class _DetailState extends State<Detail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(title: Text("${widget.list[widget.index]['item_name']}"),),
//       body: new Container(
//         height: 250.0,
//         padding: const EdgeInsets.all(20.0),
//         child: new Card(
//           child: new Center(
//             child: new Column(
//               children: <Widget>[
//
//
//                 new Padding(padding: const EdgeInsets.only(top: 30.0),),
//                 new Text(widget.list[widget.index]['item_name'],
//                    style: new TextStyle(fontSize: 20.0),),
//                 new Text("Code: ${widget.list[widget.index]['item_code']}",
//                   style: new TextStyle(fontSize:18.0),),
//                 new Text("Price: ${widget.list[widget.index]['price']}",
//                   style: new TextStyle(fontSize: 18.0),),
//                 new Text("Stock: ${widget.list[widget.index]['stock']}",
//                   style: new TextStyle(fontSize: 18.0),),
//                 new Padding(padding: const EdgeInsets.only(top: 30.0),),
//
//                 new Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     new RaisedButton(
//                       child: new Text("EDIT"),
//                       color: Colors.green,
//                       onPressed: (){},
//                     ),
//                     new RaisedButton(
//                       child: new Text("DELETE"),
//                       color: Colors.redAccent,
//                       onPressed: (){},
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index,this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {

  void deleteData(){
    var url="https://qzhang.greenriverdev.com/305/FlutterTest1/deleteData.php";
    http.post(url, body: {
      'id': widget.list[widget.index]['id']
    });
  }

  void confirm (){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are You sure want to delete '${widget.list[widget.index]['item_name']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("OK DELETE!",style: new TextStyle(color: Colors.black),),
          color: Colors.red,
          onPressed: (){
            deleteData();
            Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context)=> new Home(),
                )
            );
          },
        ),
        new RaisedButton(
          child: new Text("CANCEL",style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: ()=> Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['lessonName']}")),
      body: new Container(
        height: 600.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[

                // new Padding(padding: const EdgeInsets.only(top: 30.0),),
                // new Text(widget.list[widget.index]['lessonName'], style: new TextStyle(fontSize: 20.0),),
                // new Text("Date of Time : ${widget.list[widget.index]['time']}", style: new TextStyle(fontSize: 18.0),),
                // new Text("Student Name : ${widget.list[widget.index]['student']}", style: new TextStyle(fontSize: 18.0),),
                // new Text("Rounte Name : ${widget.list[widget.index]['route']}", style: new TextStyle(fontSize: 18.0),),
                // new Text("Stages : ${widget.list[widget.index]['stages']}", style: new TextStyle(fontSize: 18.0),),
                // new Text("Flight Time : ${widget.list[widget.index]['flightTime']}", style: new TextStyle(fontSize: 18.0),),
                // new Text("Ground Time : ${widget.list[widget.index]['groundTime']}", style: new TextStyle(fontSize: 18.0),),
                // new Text("Landing : ${widget.list[widget.index]['Landing']}", style: new TextStyle(fontSize: 18.0),),
                // new Text("Grade : ${widget.list[widget.index]['grade']}", style: new TextStyle(fontSize: 18.0),),
                // new Padding(padding: const EdgeInsets.only(top: 30.0),),

                DataTable(columns: [
                  DataColumn(label: Text(widget.list[widget.index]['lessonName'], style: new TextStyle(fontSize: 20.0),),),

                ], rows: [
                  DataRow(cells:[
                    DataCell(new Text("Date of Time : ${widget.list[widget.index]['time']}", style: new TextStyle(fontSize: 18.0),),)
                  ]
                  ),
                  DataRow(cells:[
                    DataCell(new Text("Student Name : ${widget.list[widget.index]['student']}", style: new TextStyle(fontSize: 18.0),),)
                  ]
                  ),
                  DataRow(cells:[
                    DataCell(new Text("Rounte Name : ${widget.list[widget.index]['route']}", style: new TextStyle(fontSize: 18.0),),)
                  ]
                  ),
                  DataRow(cells:[
                    DataCell(new Text("Stages : ${widget.list[widget.index]['stages']}", style: new TextStyle(fontSize: 18.0),),)
                  ]
                  ),
                  DataRow(cells:[
                    DataCell(new Text("Flight Time : ${widget.list[widget.index]['flightTime']}", style: new TextStyle(fontSize: 18.0),),)
                  ]
                  ),
                  DataRow(cells:[
                    DataCell(new Text("Ground Time : ${widget.list[widget.index]['groundTime']}", style: new TextStyle(fontSize: 18.0),),)
                  ]
                  ),
                  DataRow(cells:[
                    DataCell(new Text("Landing : ${widget.list[widget.index]['Landing']}", style: new TextStyle(fontSize: 18.0),),)
                  ]
                  ),

                  DataRow(cells:[
                    DataCell(new Text("Grade : ${widget.list[widget.index]['grade']}", style: new TextStyle(fontSize: 18.0),),)
                  ]
                  ),
                ],


                ),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("EDIT"),
                      color: Colors.green,
                      onPressed: ()=>Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context)=>new EditData(list: widget.list, index: widget.index,),
                          )
                      ),
                    ),
                    new RaisedButton(
                      child: new Text("DELETE"),
                      color: Colors.red,
                      onPressed: ()=>confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
