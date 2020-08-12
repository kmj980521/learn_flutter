import 'package:flutter/material.dart';

// ignore: camel_case_types
class hello extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Scaffold(
        appBar:AppBar(
          title: Text('Hello world!'),
        ),
        body:Text('Hello world',style:TextStyle(fontSize: 40)),
      ),


    );
  }

} //람다식

