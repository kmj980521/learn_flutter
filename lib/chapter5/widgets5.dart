import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Widgets5 extends StatefulWidget {

  @override
  _Widgets5State createState() => _Widgets5State();
}

class _Widgets5State extends State<Widgets5> {
  final items = List.generate(50, (i) => ListTile(title:Text('No. $i')));
  var _size=200.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:buildSliverList(),
    );
  }

  Scaffold buildSliverList() {
    return Scaffold(

      body:CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,//축소시 상단에 AppBar가 고정되는지 설정
            expandedHeight: 180.0, //헤더의 최대 높이
            flexibleSpace: FlexibleSpaceBar( //늘어나는 영역의 UI
              title:Text('Sliver'),
              background: Image.asset('images/global_button.png',fit:BoxFit.cover),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(items),
          )
        ],
      ),

    );
  }

  Scaffold buildSliverFillRemaining() {
    return Scaffold(

      body:CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
           pinned: true,//축소시 상단에 AppBar가 고정되는지 설정
            expandedHeight: 180.0, //헤더의 최대 높이
            flexibleSpace: FlexibleSpaceBar( //늘어나는 영역의 UI
              title:Text('Sliver'),
              background: Image.asset('images/global_button.png',fit:BoxFit.cover),
            ),
          ),
          SliverFillRemaining(
            child:Center(
              child: Text('center'),
            ),
          )
        ],
      ),

    );
  }

  Center buildAnimatedContainer() {
    return Center(
        child: GestureDetector(
          onTap: (){
            final random = Random();
            setState(() {
              _size==200? _size=350 : _size=200;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            width:_size,
            height:_size,
            child: Image.asset('images/global_button.png'),
            curve:Curves.bounceIn,
          ),
        ),
      );
  }

  Widget buildHero(BuildContext context) {
    return Center(
        child: GestureDetector(
          onTap:(){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>HeroDetailPage()));
          },
          child:Hero(
            tag:'image',
            child: Image.asset('images/global_button.png',width: 100,height: 100,),
        ),
        ),
      );
  }

  Center buildGestureAndInkWell() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                print('Click GestureDetector');
              },
              child: Text('GestureDetector'),
            ),
            InkWell(
              onTap: (){
                print('Click InkWell');
              },
              child: Text('InkWell'),
            ),

          ],
        ),
      );
  }
}

class HeroDetailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar:AppBar(
          title:Text('Hero Detail'),
        ),
        body: Hero(
          tag:'image',
          child: Image.asset('images/global_button.png'),
        ),
      ),
    );
  }
}
