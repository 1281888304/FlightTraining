import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'detail.dart';
import 'adddata.dart';
void main(){
  runApp(new MaterialApp(
    title: "My Store",
    home: new Home(),
  ));
}

class Home extends StatelessWidget {
  Future<List> getData() async {
    final response = await http
        .get('https://qzhang.greenriverdev.com/305/flutterTest/getdata.php');
    // var check = jsonDecode(response.body);
    // print(check);
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('database test'),
        ),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: ()=>Navigator.of(context).push(
            new MaterialPageRoute(
                builder:(BuildContext context)=> new AddData(),
            )
          ),
        ),
        body: new FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? new ItemList(
                    list: snapshot.data,
                  )
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          },
        ),
    );

  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
            child: new GestureDetector(
              onTap:()=>Navigator.of(context).push(
                new MaterialPageRoute(
                    builder:(BuildContext context)=>new Detail(list:list,index:i)
                )
              ),
                child: new Card(
          child: new ListTile(
            title: new Text(list[i]['item_name']),
            leading: new Icon(Icons.widgets_rounded),
            subtitle: new Text("Stock : ${list[i]['stock']}"),
          ),
        ))
        );
      },
    );
  }
}
