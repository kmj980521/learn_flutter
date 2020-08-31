import 'package:flutter/material.dart';
import 'dart:async';
class complicated_UI_example3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:StopWatchPage(),
    );
  }
}
class StopWatchPage extends StatefulWidget {
  @override
  _StopWatchPageState createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  Timer _timer;

  var _time = 0;
  var _isRunning = false;

  List<String> _lapTimes = [];

  @override
  void dispose(){
    _timer?.cancel(); // ?. 연산자를 활용하여 null 여부를 간단히 확인하기.
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('StopWatch'),
      ),
      body:_buildBody(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _clickButton();
          });
        },
        child: _isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBody() {
    var sec = _time ~/ 100;
    var hundredth = '${_time%100}'.padLeft(2,'0');
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '$sec',
                      style:TextStyle(fontSize: 50.0),
                    ),
                    Text('$hundredth'),
                  ],
                ),
                Container(
                  width: 100,
                  height: 200,
                  child: ListView(
                    children: _lapTimes.map((time)=>Text(time)).toList(),
                  ),
                )
              ],
            ),
            Positioned(
              left:10,
              bottom: 10,
              child: FloatingActionButton(
                backgroundColor: Colors.deepOrange,
                onPressed:_reset,
                child: Icon(Icons.rotate_left),
              ),
            ),
            Positioned(
                right:10,
                bottom:10,
                child:RaisedButton(
                  onPressed: (){
                    _recordLapTime('$sec.$hundredth');
                  },
                  child: Text('랩타임'),
                )
            )
          ],
        ),
      ),
    );
  }

  void _clickButton(){
    _isRunning = !_isRunning;
    if(_isRunning){
      _start();
    }
    else{
      _pause();
    }
  }

  void _start() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  void _pause() {
    _timer?.cancel();
  }

  void _reset() {
    setState(() {
      _isRunning = false;
      _timer?.cancel();
      _lapTimes.clear();
      _time=0;
    });
  }
  void _recordLapTime(String time){
    _lapTimes.insert(0, '${_lapTimes.length +1}등 $time');
  }
}



