//PageView, GridView, SingleChildScrollView, ListView,
import 'package:flutter/material.dart';

class Widgets2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title:'Flutter Demo',
        theme:ThemeData(primarySwatch: Colors.blue),
        home:Scaffold(
            body:make_PageView(),
        )
    );
  }

  PageView make_PageView() {
    return PageView(
      children: <Widget>[
        Container(
          color:Colors.red
        ),
        Container(
          color:Colors.blue
        ),
        Container(
          color:Colors.yellow
        ),
      ],
    );
  }


  GridView make_GridView() {
    return GridView.count(
              crossAxisCount: 2,
            children: <Widget>[
              Container(
                color: Colors.red,
                width: 100,
                height:100,
                padding: const EdgeInsets.all(8.0),
                margin : const EdgeInsets.all(8.0)
              ),
              Container(
                color: Colors.blue,
                width: 100,
                height:100,
                padding: const EdgeInsets.all(8.0),
                margin : const EdgeInsets.all(8.0)
              ),
              Container(
                color: Colors.purple,
                width: 100,
                height:100,
                padding: const EdgeInsets.all(8.0),
                margin : const EdgeInsets.all(8.0)
              ),
            ],
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

