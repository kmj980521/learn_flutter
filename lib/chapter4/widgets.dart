//Container, Column, Row, Stack
import 'package:flutter/material.dart';
const margin_gap = 12.0;
const padding_gap=12.0;
const double con_widht = 50;
const double con_height = 50;

class Widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Demo',
      theme:ThemeData(primarySwatch: Colors.blue),
      home:Scaffold(
        body:Column(
          children: <Widget>[
            make_container(1),
            make_Column(2,3,4,),
            make_Row(5, 6, 7),
            make_Stack(),
          ],)
      )
    );
  }
}
// ignore: non_constant_identifier_names
Container make_container(int idx){
  return Container(
    color:Colors.primaries[idx],
    width:con_widht,
    height:con_height,
    margin: EdgeInsets.all(margin_gap),
    padding: EdgeInsets.all(padding_gap),
  );
}

Column make_Column(int idx1,int idx2, int idx3){
  return Column(
    children: <Widget>[
      make_container(idx1),
      make_container(idx2),
      make_container(idx3)
    ],
  );
}

// ignore: non_constant_identifier_names
Row make_Row(int idx1,int idx2, int idx3){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      make_container(idx1),
      make_container(idx2),
      make_container(idx3),
    ],
  );
}

Stack make_Stack(){
  return Stack(
    children: <Widget>[
      Container(
        width:70,
        height:70,
        margin: EdgeInsets.all(margin_gap),
        padding: EdgeInsets.all(padding_gap),
        color:Colors.primaries[8],
      ),
      Container(
        width:55,
        height:55,
        margin: EdgeInsets.all(margin_gap),
        padding: EdgeInsets.all(padding_gap),
        color:Colors.primaries[9],
      ),
      Container(
        width:40,
        height:40,
        margin: EdgeInsets.all(margin_gap),
        padding: EdgeInsets.all(padding_gap),
        color:Colors.primaries[10],
      ),

    ],
  );
}