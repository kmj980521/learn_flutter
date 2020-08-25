import 'package:flutter/material.dart';
class Person{
  String name;
  int age;

  Person(this.name, this.age);
}
class Widgets7 extends StatefulWidget {
  @override
  _Widgets7State createState() => _Widgets7State();
}

class _Widgets7State extends State<Widgets7> {
  @override
  Widget build(BuildContext context) {
    return FirstClass();
  }
}

class FirstClass extends StatefulWidget {

  @override
  _FirstClassState createState() => _FirstClassState();
}

class _FirstClassState extends State<FirstClass> {
  @override
  void initState(){
    super.initState();
    print('FirstPage initState()');
  }
  @override
  void dispose(){
    super.dispose();
    print('FirsPage dispose()');
  }
  @override
  Widget build(BuildContext context) {
    print('FirsPage build()');
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

class SecondClass extends StatefulWidget {
  final Person person;

  SecondClass({@required this.person});

  @override
  _SecondClassState createState() => _SecondClassState();
}

class _SecondClassState extends State<SecondClass> {
  void initState(){
    super.initState();
    print('Second initState()');
  }
  @override
  void dispose(){
    super.dispose();
    print('Second dispose()');
  }
  @override
  Widget build(BuildContext context) {
    print('Second build()');
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(title: Text('두 번째 페이지'),),
        body:Center(
          child: FlatButton(
            onPressed: (){
              Navigator.pop(context,'ok');
              print(widget.person.age);
            },
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

