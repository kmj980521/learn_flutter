import 'package:flutter/material.dart';
import 'package:learn_flutter/chapter3/counting_app.dart';

class Complicated_UI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];
  var _idx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '복잡한 UI',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {
              print('click');
            },
          ),
        ],
      ),
      body: _pages[_idx],
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('홈'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              title: Text('이용서비스'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('내 정보'),
            ),
          ],
          onTap: (index) {
            setState(() {
              _idx = index;
            });
          }),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '홈페이지',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '홈페이지2',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '홈페이지3',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
