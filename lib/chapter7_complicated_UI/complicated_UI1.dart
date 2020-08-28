import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/chapter3/counting_app.dart';

final dummyItems = [
  'https://miro.medium.com/max/700/1*TkNd1PwwwdBi9Z3kdG5Hng.png',
  'https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/1YN0/image/ak-gRe29XA2HXzvSBowU7Tl7LFE.png',
  'https://cdn.inflearn.com/public/courses/324050/course_cover/fd43129d-b09b-453f-bad5-8dfc95741506/flutter2.png'
];
class complicated_UI_example1 extends StatelessWidget {
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
    return ListView(
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }
}

Widget _buildTop() {
  return Padding(
    padding: const EdgeInsets.only(top:20.0,bottom: 20.0),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap:(){
                print('test');
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.local_taxi, size: 40),
                  Text('택시'),
                ],
              ),
            ),
            GestureDetector(
              onTap:(){
                print('test');
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.local_taxi, size: 40),
                  Text('택시'),
                ],
              ),
            ),
            GestureDetector(
              onTap:(){
                print('test');
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.local_taxi, size: 40),
                  Text('택시'),
                ],
              ),
            ),
            GestureDetector(
              onTap:(){
                print('test');
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.local_taxi, size: 40),
                  Text('택시'),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap:(){
                print('test');
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.local_taxi, size: 40),
                  Text('택시'),
                ],
              ),
            ),
            GestureDetector(
              onTap:(){
                print('test');
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.local_taxi, size: 40),
                  Text('택시'),
                ],
              ),
            ),
            GestureDetector(
              onTap:(){
                print('test');
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.local_taxi, size: 40),
                  Text('택시'),
                ],
              ),
            ),
            Opacity(
              opacity: 0.0,
              child: Column(
                children: <Widget>[
                  Icon(Icons.local_taxi, size: 40),
                  Text('택시'),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildMiddle() {
  return CarouselSlider(
    options: CarouselOptions(
        height: 200.0,
        autoPlay: true),

    items: dummyItems.map((url) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: Colors.amber
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(url,fit:BoxFit.cover),
              ),
          );
        },
      );
    }).toList(),
  );
}

Widget _buildBottom() {
  final items = List.generate(10, (idx){
    return GestureDetector(
      onTap:(){
        print('test $idx');
      },
      child: ListTile(
        leading: Icon(Icons.notifications_none),
        title:Text('[이벤트] 이것은 공지사항입니다.'),
      ),
    );
  });
  return ListView(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    children: items,
  );
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
