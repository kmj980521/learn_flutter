import 'package:flutter/material.dart';

class Change extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:ChangeState(),
    );
  }
}
class ChangeState extends StatefulWidget {
  @override
  _ChangeStateState createState() => _ChangeStateState();
}

class _ChangeStateState extends State<ChangeState> {
  List string = ['Hello','world'];
  var idx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Hello world'),
      ),
      body:Padding(
        padding: const EdgeInsets.only(left:8.0),
        child: Text(
          '${string[idx]}',
          style:TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          setState(() {
            idx == 0 ? idx=1 : idx= 0;
          });
        },
        child: Icon(Icons.touch_app),
      ),
    );
  }
}


