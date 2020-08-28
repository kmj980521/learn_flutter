//SiedBox, MediaQuery, FloatingActionButton, FlatButton, IconButton, DefaultTabController, BottomNavigationBar, Card

import 'package:flutter/material.dart';
import 'package:learn_flutter/size.dart';
class Widgets3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /*if(size==null)
      {
        size = MediaQuery.of(context).size;
      }*/
    //final width = MediaQuery.of(context).size.width;
    return MaterialApp(
        title:'Flutter Demo',
        theme:ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          body:_buildMiddle() ,
        ),

    );
  }

}

Widget _buildMiddle(){
  return Builder(
    builder: (BuildContext context){
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height:100,
                width: 100,
                child: FlatButton(
                  child: Text('Flatbutton'),
                  onPressed: () {
                    print('Click FlatButton');
                  },
                ),
              ),

              SizedBox(
                height: 100,
                width: 100,
                child: FloatingActionButton(
                  child: Center(child: Text('loatingActionButton')),
                  onPressed: () {
                    print('Click FloatingActionButton');
                  },
                ),
              ),

              SizedBox(
                height: 100,
                width: 100,
                child: IconButton(
                  icon: Icon(Icons.add),
                  iconSize: 30,
                  onPressed: () {
                    print('Click IconButton');
                  },
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: RaisedButton(
                  child: Text('RaisedButton'),
                  onPressed: () {
                    print('Click RaisedButton');
                  },
                ),
              ),


            ],
          ),

      );
    },
  );
}


DefaultTabController buildDefaultTabController() {
  return DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        title: Text('Tap'),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.tag_faces)),
            Tab(text: '메뉴2'),
            Tab(icon: Icon(Icons.info), text: '메뉴3'),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          Container(
              height: 100,
              width: 100,
              color: Colors.red
          ),
          Container(
              height: 100,
              width: 100,
              color: Colors.blue
          ),
          Container(
              height: 100,
              width: 100,
              color: Colors.yellow
          ),
        ],
      ),
    ),
  );
}
Scaffold buildBottomNavigationBar() {
  return Scaffold(
    bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            title:Text('Home'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.person),
            title:Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.notifications),
            title:Text('Notification'),
          ),
        ]
    ),
  );
}
Center make_Card(){
  return Center(
    child: Card(
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4.0,
      child:Container(
        width:200,
        height:200,

        child: FlatButton(
            onPressed: (){
              print('hello');
            },
            child:Text('여기를 누르세요')
        ),
      ),
    ),
  );
}