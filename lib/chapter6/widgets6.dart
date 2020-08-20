import 'package:flutter/material.dart';
class Person{
  String name;
  int age;

  Person(this.name, this.age);
}
class Widgets6 extends StatefulWidget {
  @override
  _Widgets6State createState() => _Widgets6State();
}

class _Widgets6State extends State<Widgets6> {
  @override
  Widget build(BuildContext context) {
    return FirstClass();
  }
}

class FirstClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(title: Text('첫 번째 페이지'),),
        body:Center(
          child: FlatButton(
            onPressed: () async {
              final person = Person('홍길동',20);
              final result = await Navigator.push(context,MaterialPageRoute(builder: (context)=>SecondClass(person:person)));

              print(result);
            },
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class SecondClass extends StatelessWidget {
  final Person person;

  SecondClass({@required this.person});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(title: Text('두 번째 페이지'),),
        body:Center(
          child: FlatButton(
            onPressed: (){
              Navigator.pop(context,'ok');
              print(person.age);
            },
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

