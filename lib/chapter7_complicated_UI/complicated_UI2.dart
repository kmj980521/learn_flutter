import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class complicated_UI_example2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Demo',
      home:Scaffold(
        appBar:AppBar(
          title:Text('폼 검증 데모'),
        ),
        body:BmiMain(),
      ),
    );
  }
}
class BmiMain extends StatefulWidget {
  @override
  _BmiMainState createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose(){
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  border:OutlineInputBorder(),
                hintText: '키',
              ),
              keyboardType: TextInputType.number,
              controller: _heightController,
              validator: (value){
                if(value.trim().isEmpty){
                  return '키를 입력하세요';
                }
                return null;
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                border:OutlineInputBorder(),
                hintText: '몸무게',
              ),
              keyboardType: TextInputType.number,
              controller: _weightController,
              validator: (value){
                if(value.trim().isEmpty){
                  return '몸무게를 입력하세요';
                }
                return null;
              },
            ),
            Container(
              margin: const EdgeInsets.only(top:16.0),
              alignment: Alignment.centerRight,
              child: RaisedButton(
                onPressed: (){
                  if(_formkey.currentState.validate()){//키와 몸무게가 검증이되었다면 화면 이동
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>_BmiResult(
                      double.parse(_heightController.text.trim()),
                      double.parse(_weightController.text.trim())
                    )));
                  }
                },
                child: Text('결과'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _BmiResult extends StatelessWidget {
  final double height;
  final double weight;



  _BmiResult(this.height,this.weight);
  @override
  Widget build(BuildContext context) {
    final bmi = weight / ((height/100) *(height/100));
    print('$bmi');

    String _calcBmi(double bmi){
      var result = '저체중';
      if(bmi>=35){
        result ='고도 비만';
      }
      else if(bmi>=30){
        result='2단계 비만';
      }
      else if(bmi>=25){
        result='1단계 비만';
      }
      else if(bmi>=23){
        result='과체중';
      }
      else if(bmi>=18.5){
        result='정상';
      }
      return result;
    }
    Widget _buildIcon(double bmi){
      if(bmi>=23){
        return Icon(
          Icons.sentiment_very_dissatisfied,
          color:Colors.red,
          size:100,
        );
      }
      else if(bmi>=18.5){
        return Icon(
          Icons.sentiment_satisfied,
          color:Colors.green,
          size:100,
        );
      }
      else{
        return Icon(
          Icons.sentiment_dissatisfied,
          color:Colors.orange,
          size:100,
        );
      }
    }
    return Scaffold(
      appBar:AppBar(
        title:Text('비만도 계산기')
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _calcBmi(bmi),
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(
              height: 16.0,
            ),
            _buildIcon(bmi),
          ],
        ),
      )
    );
  }
}

class _CustomForm_example extends StatefulWidget {
  @override
  _CustomForm_exampleState createState() => _CustomForm_exampleState();
}

class _CustomForm_exampleState extends State<_CustomForm_example> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key:_formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value){
              if(value.isEmpty){
                return '글자를 입력하세요';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0),
            child: RaisedButton(
              onPressed: (){
                if(_formKey.currentState.validate()){
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('검증 완료'),));
                }
                else{
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('검증 실패'),));
                }
              },
              child: Text('검증'),
            ),
          ),
        ],
      ),
    );
  }
}

class _textField extends StatefulWidget {
  @override
  _textFieldState createState() => _textFieldState();
}

class _textFieldState extends State<_textField> {
  final myController = TextEditingController();

  @override
  void initState(){
    super.initState();
    myController.addListener(_printLatestVale);
  }
  @override
  void dispose(){ //화면이 종료될 때는 반드시 위젯 트리에서 컨트롤러를 해제해야 한다.
    myController.dispose();
    super.dispose();
  }
  void _printLatestVale() {
    print('두 번째 text field: ${myController.text}');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Pratice Text Input '),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            onChanged: (text){
              print('첫 번째 text field: $text');
            },
          ),
          TextField(
            controller: myController,
          ),
        ],
      ),
    );
  }



}

