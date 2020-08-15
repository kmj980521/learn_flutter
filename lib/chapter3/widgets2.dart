import 'package:flutter/material.dart';

class Widgets2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title:'Flutter Demo',
        theme:ThemeData(primarySwatch: Colors.blue),
        home:Scaffold(
            body:make_listview(),
        )
    );
  }
}

final items = List.generate(100, (i) => i).toList(); //items라는 리스트 만들기.

SingleChildScrollView make_scrollview(){
 return SingleChildScrollView(
   child: ListBody(
     children: items.map((i) => Text('$i')).toList()
   ),
 );
}

ListView make_listview(){
  return ListView(
    scrollDirection: Axis.vertical,
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.home),
        title:Text('Home'),
        trailing: Icon(Icons.navigate_next),
        onTap:(){},
      ),
      ListTile(
        leading: Icon(Icons.event),
        title:Text('Event'),
        trailing: Icon(Icons.navigate_next),
        onTap:(){},
      ),
      ListTile(
        leading: Icon(Icons.camera),
        title:Text('Camera'),
        trailing: Icon(Icons.navigate_next),
        onTap:(){},
      ),
    ],
  );
}