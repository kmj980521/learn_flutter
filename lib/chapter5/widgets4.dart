import 'package:flutter/material.dart';

class Widgets4 extends StatefulWidget {
  @override
  _Widgets4State createState() => _Widgets4State();
}
enum Gender {MAN,WOMEN}
enum Gender_Tile {global_campus,seoul_campus}

class _Widgets4State extends State<Widgets4> {

  String _selectedTime;
  DateTime _selectedDateTime;

  var _isCheckedBox = false;
  var _isCheckedSwitch = false;
  Gender _gender = Gender.MAN;

  // ignore: non_constant_identifier_names
  Gender_Tile _gender_tile = Gender_Tile.global_campus;

  final _valueList = ['첫 번째', '두 번째', '세 번째'];
  var _selectedValue = '첫 번째';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          body: buildDropdownButton()),


    );
  }

  Center buildDropdownButton() {
    return Center(
      child: DropdownButton(
        value: _selectedValue,
        items: _valueList.map((value) {
          return DropdownMenuItem(
            child: Text(value),
            value: value,
          );
        }
        ).toList(),
        onChanged: (value) {
          setState(() {
            _selectedValue = value;
          });
        },
      ),
    );
  }

  Center buildRadio() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            title: Text('남자'),
            leading: Radio(
              value: Gender.MAN,
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('여자'),
            leading: Radio(
              value: Gender.WOMEN,
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
          ), RadioListTile(
            title: Text('글로벌 캠퍼스'),

            value: Gender_Tile.global_campus,
            groupValue: _gender_tile,
            onChanged: (value) {
              setState(() {
                _gender_tile = value;
              });
            },
          ), RadioListTile(
            title: Text('서울 캠퍼스'),

            value: Gender_Tile.seoul_campus,
            groupValue: _gender_tile,
            onChanged: (value) {
              setState(() {
                _gender_tile = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildCheckBoxAndSwitch() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Spacer(flex: 1),
          Checkbox(
            value: _isCheckedBox,
            onChanged: (value) {
              setState(() {
                _isCheckedBox = value;
              });
            },
          ),
          SizedBox(
            height: 40,
          ),
          Switch(
            value: _isCheckedSwitch,
            onChanged: (value) {
              setState(() {
                _isCheckedSwitch = value;
              });
            },
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }

  Widget buildTextField() {
    return Center(
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: '여기에 입력하세요',
        ),
      ),
    );
  }

  Column buildDatePicker(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            Future<DateTime> selectedDate = showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              // 초깃값
              firstDate: DateTime(2018),
              // 시작일
              lastDate: DateTime(2030),
              // 마지막일
              builder: (BuildContext context, Widget child) {
                return Theme(
                  data: ThemeData.dark(), // 다크테마
                  child: child,
                );
              },
            );

            selectedDate.then((dateTime) {
              setState(() {
                _selectedDateTime = dateTime;
              });
            });
          },
          child: Text('Date Picker'),
        ),
        Text('$_selectedTime'),
      ],
    );
  }

  Column buildTimePicker(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            Future<TimeOfDay> selectedTime = showTimePicker(
              initialTime: TimeOfDay.now(),
              context: context,
            );

            selectedTime.then((timeOfDay) {
              setState(() {
                _selectedTime = '${timeOfDay.hour}:${timeOfDay.minute}';
              });
            });
          },
          child: Text('Time Picker'),
        ),
        Text('$_selectedTime'),
      ],
    );
  }
}




