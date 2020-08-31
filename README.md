# learn_flutter

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# 다트 문법
1int와 double은 **num**타입에 포함된다.  
2)**var**를 사용해 타입을 직접 명시하지 않고 타입 추론을 한다.  
3)상수는 **fianl**키워드를 사용한다.  
4)**assert()** 함수는 계산 결과가 참인지 검사한다.  
5)**is** 키워드는 타입을 검사한다.
```dart
int a = 10;
      if (a is int){
        print('정수');
}
```
6)**as** 키워드는 형변환을 한다. 단, 다른 타입끼리는 변환이 안 되고 더 상위 개념으로만 변환이 가능
```dart
var c = 30.5;
int d = c as int; //에러 int와 double은 모두 num을 구현하는 타입이지만 서로는 관계가 없기 때문에 형변환이 불가능.
------------------
dynamic d =30.5;
num n = d; //as num; 생략 가능. int와 double 모두 상위 개념인 num으로 형변환할 수 있다.
```
7)**static**키워드는 클래스 내부에 선언된 함수더라도 정적 메서드가 되며 함수로 볼 수 있다. 최상위 함수처럼 사용할 수 있다.  
8)**람다식 표현** 
```dart
(number)=>number%2 == 0; //number가 짝수인지 판별
```
9)**선택 매개변수**. 함수 정의에서 {}로 감싼 매개변수는 선택적으로 사용할 수 있다. 호출할 때 매개변수명을 값 앞에 써주면 되는데 이런 매개변수를 **이름 있는 매개변수**라고 한다.
```dart
void something(String name, {int age}){} //int age = 10과 같이 기본값을 지정할 수도 있다.
void main(){
something('홍길동',age:10); //ok
something('홍길동'); //ok
something(age:10); //error name은 필수로 들어가야함.
something(); //error name은 필수로 들어가야함. 
}
```
10)**객체(object)**란 저장 공간에 할당되어 값을 가지거나 식별자에 의해 참조되는 공간. 이러한 객체를 메모리에 작성하는 것을 **인스턴스화**한다고 한다. 메모리에 작성된 객체를 **인스턴스**라고 하고, 인스턴스화하기 위해서는 설계도가 필요한데 설계도 역할을 하는 것이 **클래스**이다. 클래스 안에는 속성을 표현할 수 있는데 이를 **프로퍼티**라고 한다.  
11)**new**키워드를 사용해 인스턴스화 시키고, **.연산자**를 통해 객체의 프로퍼티에 접근할 수 있다.  
12)변수명 앞에 **_ 기호 **를 붙이면 외부에서 접근이 불가능 해진다.(private) 이러한 메서드를 접근하기 위해서 **게터**와 **세터**메서드를 작성해야 한다.  
```dart
class Rectangle{
num left, top, width, height;
Rectangle(this.left, this.top, this.width, this.height);

num get right => left + width; //오른쪽 점을 알기 위해 right는 left와 width를 더한 값을 반환한다. 
set right(num value) => left = value - width; //오른쪽 점을 설정하기 위해 원하는 위치값 value를 매개인자로 받아 value에서 width를 뺀 값을 left에 할당한다.
```
}
13)상속은 **extends**키워드를 사용하여 부모 클래스의 기존 기능을 재정의할 때 사용한다.  
14)추상클래스는 **abstract**키워드를 사용하고, 추상 클래스는 그대로 인스턴스화할 수 없으며, 다른 클래스에서 **임플리먼트**하여 기능을 완성하는 상속 재료로 사용되고, 대상 클래스에는 **implements**키워드를 사용하고, 메서드에는 **@override**키워드를 사용한다. 여러 추상 클래스를 한 번에 임플리먼트할 수도 있으나 추상 클래스를 구현할 때는 모든 추상 메서드를 꼭 재정의해야 한다.
15)**믹스인**. **with**키워드를 사용하면 상속하지 않고 다른 클래스의 기능을 가져오거나 오버라이드할 수 있다. **다형성**이라고도 한다.
```dart
class Goblin implements Monster{
@override
void attack(){
      print('고블린 어택');
}
}
class DarkGoblin extends Goblin with Hero {
      
}//DarkGoblin 클래스는 Goblin이기도 하며, Hero이기도 하며, Monster이기도 한다. 
```
16)다트는 List, Map, Set등의 **컬렉션**을 제공한다.  
  16-1) List : 같은 타입의 자료를 여러 개 담을 수 있고 특정 인덱스로 접근이 가능하다. **스프레드 연산자**(...)를 사용해 다른 컬렉션 안에 컬렉션을 삽입할 때 사용한다.
```dart
      List<dynamic> list = [1,2,3,'hello']; //dynamic은 모든 타입을 대변하는 특수한 타입.
      var items =['mon','tue','wed'];
      
      final items = [1,2,3,4];
      final mynum = [...items,5,6];
      print(mynum); //1,2,3,4,5,6
```
  16-2) Map : 순서가 없고 탐색이 빠른 자료구조 컬렉션이고, **키**와 **값**의 쌍으로 이루어져 있어 키를 이용하여 값을 빠르게 얻을 수 있다. 만약 요청한 키에 해당하는 값이 없다면 값 없음을 의미하는 null을 반환한다.
```dart
      var cityMap {
            '한국':'부산',
            '일본':'도쿄'
      }
      cityNap['미국']='워싱턴'; //새로운 값 추가
```      
  16-3) Set : 집합을 표현하는 자료구조 컬렉션이고, **add(), remove()**메서드로 집합에 추가하거나 삭제를 하고, **contains()**메서드는 찾고자 하는 자료가 집합에 있는지 없는지 **불리언 타입**으로 반환한다. 리스트와는 다르게 중복을 허용하지 않는다.
```dart
      var citySet = {'서울','수원','오산','부산'};
      citySet.add('안양');
      citySet.remove('수원');
      print(citySet.contains('서울')); //true
``` 
17)dart는 **객체 지향 프로그래밍**과 **함수형 프로그래밍**의 특징을 모두 제공한다.  
```dart
void something(Function(int i) f){
  f(10);
}

void main() {
 something((value){
   print(value);
 });
}
```  
something() 함수는 인수로 Function이라는 특수한 클래스의 인스턴스를 받는다. **Function**키워드는 다트에서 함수를 매개변수로 전달하고자 할 때 사용하는 타입. something() 함수는 내부에서 10이 매개변수로 전달된 f() 함수를 돌려준다. f() 함수는 익명 함수이다.  함수를 매개변수로 전달하기, 수정하기, 변수에 대입하기가 가능한 객체를 **일급 객체**라고 한다.  
```dart
void something(Function(int i )f){
  f(10);
}

void myPrint(int i){
  print('내가 만든 함수에서 출력한 $i');
}

void main(){
  something(myPrint); //내가 만든 함수에서 출력한 10
  something((i)=>myPrint(i)); //내가 만든 함수에서 출력한 10
  something((i)=>print(i)); //10
  something(print); //10
}
```
-> 첫줄 설명 : myPrint()를 호출하고, 그 myPrint() 함수가 something의 매개변수 f로 익명 함수로 작동하고, 그 함수에 10을 전달한다. 즉 myPrint() 함수에는 10이 전달되어 10을 출력한다.  
18) for문은 **외부반복** forEach문은 **내부반복**을 수행한다. 
```dart
void main(){
  final list = [1,2,3,4,5];
  
  for(var i =0; i<list.length;i++)
  {
    print(list[i]);
  }
  list.forEach(print); //int 타입의 인수를 받아 print()를 실행
  
  list.forEach((item)=>print(item)); //람다식표현
}
```  
19)**where** 키워드는 조건을 필터링할 때 사용하는 함수이며, **map**함수는 반복되는 값을 다른 형태로 변환하는 방법을 제공하는 함수이다. .연산자를 찍고 연속적으로 사용하는    **메서드 체인**을 지원한다.
```dart
void main(){
  final list = [1,2,3,4,5];
  
  list.where((item)=>item%2==0).forEach(print); //item이 짝수면 print를 한다.
  
  list.where((item)=>item%2==0).map((item)=>'숫자 $item').forEach(print); //짝수를 찾아 그 짝수에 숫자 문자열을 붙이고 print한다.
  
}
```  
20)**toList**는 결과를 리스트로 저장하고, 만약 중복되는 값을 제거한 리스트를 얻고 싶으면 **toSet**를 사용해 세트로 저장을 한다.
```dart
void main(){
  final list = [1,2,2,3,3,4,5];
  
  final result_list=list.where((item)=>item%2==0).toList();
  
  final result_set=list.where((item)=>item%2==0).toSet();
  print(result_list); //[2, 2, 4]
  print(result_set); // (2, 4)
}
```  
21)**any**함수는 리스트에 특정 조건을 충족하는 요소가 있는지 없는지 계산을 할 때 사용한다.   
22)**계단식 표기법..** 을 사용하여 동일 객체에서 일련의 작업을 수행하고, 매번 리스트가 반환되어 임시 변수를 만드는 단계를 절약시키고 더 유동적인 코드를 작성할 수 있다.
```dart
void main(){
  final list=[1,2,3,4,5];
  
  print(list..add(6)..remove(2)); //1,3,4,5,6
}
```  
23)**?.** 연산자를 이용하여 null 여부를 간단히 판단할 수가 있다. 객체의 프로퍼티나 메서드에 접근할 때 . 연산자 대신 ?. 연산자를 사용하면 **객체가 null일 때 에러를 발생하는 대신 null을 반환**한다.  
**??** 연산자는 객체가 null일 때 작동을 간단히 구현하는 데 사용한다. 
```dart
void main(){
  String name= null;
  print(name?.length); //null 출력
  print(name?.length ?? 0);// name.length의 길이를 판별하는데 이때 name은 null이다. 즉 name이 null이면 ??를 통해 null을 판별하고 0을 출력한다. -> 0출력
}
```  
# flutter 기본적인 앱 구조  
1)**StatelessWidget 클래스**는 상태를 가지지 않는 위젯을 구성하는 기본 클래스이다. 상태를 가지지 않는다는 것은 한 번 그려진 후 다시 그리지 않는 경우이며, 이러한 클래스는 프로퍼티로 변수를 가지지 않는다.(상수는 가질 수 있다.) / **build()** 메서드는 위젯을 생성할 때 호출되는데, 실제로 화면에 그릴 위젯을 작성해 변환한다.  
2)**MaterialApp**클래스는 title, theme, home등등의 인수를 가진다. tilte은 제목, theme은 테마, home은 작성하는 위젯이 실제 이 앱이 표시하는 위젯이 된다.  
3)**StatefulWidget 클래스**는 StatefulWidget 클래스에서 상속받은 createState()메서드를 재정의하여 클래스의 인스턴스를 반환한다. 이 메서드는 StatefulWidget이 생성될 때 한 번만 실행이 된다. State클래스를 상속받은 클래스를 **상태 클래스**라고 한다. 상태 클래스는 변경 가능한 상태를 프로퍼티 변수로 표현하고, 이 변수의 값을 변경하면 화면을 다시 그리게 된다.  
4)위젯 사이의 데이터 전달은 **생성자를 활용**한다. 상태 클래스에서 StatefulWidget 클래스에 접근하려면 widget 프로퍼티를 사용한다.  
```dart
MYHomePage({Key key, this.title}) : super(key: key);
...
title: Text(widget.title), //widget 프로퍼티 사용
```  
5)**Scaffold**클래스는 머티리얼 디자인 앱을 만들 때 뼈대가 되는 위젯이다. 즉, 머티리얼 디자인 앱을 만든다면 MaterialApp -> Scaffold가 기본 형태이다.  
6)Scaffold 클래스의 FloatingActionButton은 setState를 통해 상태를 변경해주고 리빌드한다.  

# 기본 위젯 / widgets.dart파일 참조
1)화면을 구성하는 컴포넌트를 **위젯**이라고 부른다.  
2)**Container**는 아무것도 없는 위젯이고 다양한 프로퍼티를 가지고 있기 때문에 여러가지로 사용이 된다.  
3)**Column**위젯과 **Row**위젯의 mainAxis와 crossAxis는 서로 다르다. Column은 세로가 mainAxis고, Row는 가로가 mainAxis이다. MainAxisSize를 통해 공간을 설정할 수 있고, MainAxisAlignment와 CrossAxisAlignment에 center, start, end, spaceEvenly, spaceBetween, spaceAround등을 통해 여백을 조절할 수 있다.  
4)**Stack**위젯은 children에 나열한 여러 위젯을 순서대로 겹치게 한다. children 프로퍼티에 정의한 리스트에 먼저 작성한 위젯이 가장 아래쪽에 위치하고, 나중에 작성한 위젯이 위쪽에 위치하게 된다.  
# 기본 위젯2 / widgets2.dart 파일 참조
1)**SingleChildScrollView**를 사용하여 Column에 나열된 위젯들이 화면 크기를 넘어서면 스크롤을 하게끔 한다. SingleChildScrollView는 하나의 자식 위젯을 가져야 하기 때문에 Column을 사용하여 스크롤을 구현할 수 있지만, Column은 표시할 위젯의 크기만큼 가로 길이를 가진다. 이때 **ListBody**를 사용하면 스크롤 가능 영역이 가로로 꽉 차기 때문에 사용자가 스크롤하기 더 편해진다.  
2)**ListView**위젯은 SingleChildScrollView와 ListBody의 조합과 동일한 효과를 내지만 좀 더 리스트 표현에 최적화된 위젯이다. ListView에 표시할 각 항목의 레이아웃은 직접 정의해도 되지만 리스트 아이템을 쉽게 작성할 수 있는 **ListTile**위젯을 사용하면 편리하다.  
3)**GridView** 위젯을 사용하여 열 수를 지정하여 그리드뷰를 생성한다.
```dart
GridView.count(
  crossAxisCount: [열 수],
  children: <Widget> [
     [위젯],
     [위젯],
     [위젯],
  ]
)
```
4)**PageVeiw**위젯을 사용하여 여러 페이지를 좌우로 슬라이드하여 넘길 수 있도록 해준다. 
# 기본 위젯3 / widgets3.dart 파일 참조
1)**DefaultTabController**로 Scaffold를 감싸고 Scaffold의 bottom에 TabBar를 통해 Tab의 리스트를 지정한다.  
2)Scaffold의 bottomNavigationBar의 **BottomNavigationBar**를 사용해 하단 탭 바를 구성한다.  
3)**Center**위젯을 사용해 중앙으로 정렬시킨다.  
4)**Padding**위젯을 사용해 안쪽 여백을 표현한다. EdgeInsets 클래스를 사용하여 설정하고, 앞에 const를 붙이면 컴파일 타임에 상수로 정의되어 다시 사용되는 부분이 있을 경우에 메모리에 있는 값을 재사용하는 이득이 있다.  
5)**Align**위젯을 사용하여 자식 위젯의 정렬 방향을 정할 수 있다. 
```dart
Align(
  alignment: Alignment.bottomRight,
  child: [위젯]
)
```
6)**Expanded**위젯을 사용하여 자식 위젯의 크기를 최대한으로 확징시켜준다. 
7)위젯을 특정 크기로 만들고 싶을 때는 **SizedBox**위젯을 사용한다. 
8)**Card**위젯을 사용하여 카드 형태의 모양을 만든다. 기본적으로 크기가 0이므로 자식 위젯의 크기에따라 크기가 결정된다. shape프로퍼티를 통해 RoundedRectangleBorder 클래스의 인스턴스를 지정해 카드 모서리의 둥근 정도를 실숫값으로 조정한다.  
9)**RaisedButton**은 입체감을 가지는 일반적인 버튼 위젯이다. **FlatButton**은 평평한 형태의 버튼이다. **IconButton**은 아이콘을 표시하는 버튼이다. IconButton은 아이콘의 크기나 색을 지정할 수 있다. 또한, IconButton 위젯은 child 프로퍼티가 없는 대신 아이콘을 icon 프로퍼티에 작성하고 크기는 iconSize 프로퍼티로 설정한다.  
10)**MediaQuery**를 사용하기 위해서는 Builder를 활용한다.
```dart
Widget _buildMiddle(){
  return Builder(
   builder: (BuildContext context){
     return SizedBox(
       width: MediaQuery.of(context).size.width,
       height:MediaQuery.of(context).size.height,
     );
   }
  )
}
```
11)**Text** 위젯을 사용하여 글자를 표시한다. Textㅇ 위젯은 기본적으로 첫 번째 인수에 문자열을 지정하고, **style 프로퍼티에 TextStyle 클래스의 인스턴스를 지정**하여 다양한 글자를 표현한다.  
12)**Image**위젯을 사용하여 이미지를 표시한다. **Image.network('url')** 를 사용해도 되고, pubspec.yaml 파일에서 assets를 수정해도 된다.  
13)**Icon**위젯을 사용하여 여러가지 아이콘을 표시한다. 아이콘 위젯은 단독으로도 사용하지만 메뉴나 리스트, 버튼과의 조합으로 사용된다. 머터리얼 디자인용 기본 아이콘들은 **Icons** 클래스에 상수로 정의되어 있다.  
14)**Progress** 위젯을 사용하여 로딩 중이거나 오래 걸리는 작업을 할 때 사용자에게 진행 중임을 보여주는 용도로 사용한다. 둥근 형태의 **CircularProgressIndicator()** 와 선 형태의 **LinearProgressIndicator()** 를 사용한다.  
15)**CircleAvatar** 위젯을 사용하여 프로필 화면에 자주 사용하는 원형 위젯이다. 네트워크상에 존재하는 이미지를 표시한다면 child 프로퍼티가 아닌 backgroundImage 프로퍼티에 NetworkImage 클래스의 인스턴스를 지정해야 네트워크에서 받아온 이미지가 원형으로 표시된다.  

# 기본 위젯4 / widgets4.dart 파일 참조 / 입력용 위젯
1)**TextField()** 위젯을 통해 글자를 입력받고, InpuDecoration 클래스와 함께 사용하여 힌트 메시지나 외곽선등의 꾸밈 효과를 추가한다.  
2)**CheckBox**와 **Swtich** 위젯을 통해 설정 화면 등에 많이 사용되는 체크박스, 라디오 버튼, 스위치를 표현한다. 이 둘은 상태를 나타낼 **불리언 타입의 변수가 필요**하고 **value 프로퍼티에 설정**한다. **onChanged** 이벤트는 체크값이 변할 때마다 발생하므로 StatefulWidget이어야 하며, **setsState()**를 통해 value 프로퍼티에 지정한 변숫값을 변경하여 UI를 다시 그린다.  
3)**Radio**와 **RadioListTile**위젯을 통해 선택 그룹 중 하나를 선택할 때 사용한다. 어디까지를 터치 영역으로 볼 것이냐에 따라 Radio를 사용하거나 RadioListTile을 사용한다. Radio 그룹 내에서 하나만 선택을 하기 때문에 그룹이 되는 항목을 열거형(enum)으로 정의하고 **groupValue 프로퍼티**에 열거형으로 정의한 변수를 지정하고, onChanged 이벤트에서 변경된 값을 반영한다. RadioListTile은 가로 전체가 터치 영역이 된다.  
4)**DropDownButton** 위젯은 여러 아이템 중 하나를 고를 수 있는 콤보박스 형태의 위젯이다. value 프로퍼티에 표시할 값을 지정하고, items 프로퍼티에는 표시할 항목을 DropdownMenuItem 클래스의 인스턴스들을 담은 **리스트로 지정**해야 한다.  
5)**AlertDialog**위젯은 머티리얼 디자인의 유저 확인용 다이얼로그 위젯이다. AlertDialog를 표시하려면 showdialog() 함수의 builder 프로퍼티에 AlertDialog 클래스의 인스턴스를 반환하는 함수를 작성하면 된다. showDialog() 함수의 barrierDismissible 프로퍼티는 다이얼로그 바깥 부분을 터치해도 닫히게 할 것인지 정한다. title은 제목, content는 내용, actions프로퍼티는 Navigator를 설정한다.  
6)**DatePicker** 위젯을 통해 날짜를 선택한다. showDatePicker() 함수를 호출해야하며, 함수의 프로퍼티에는 context를 인수로 전달하고, initialDate는 초기 선택값, firstDate와 lastDate는 DatePicker에 표시할 날짜의 범위를 정하고, builder 프로퍼티는 테마를 설정할 때 사용한다.  
7)**TimePicker** 위젯을 사용하여 시간을 선택한다. initialTime 프로퍼티에는 초기값을 지정하고, context가 필요하며, Future 타입으로 TimeOfDay 타입의 값을 반환한다.  

# 기본 위젯5 / widgets5.dart 파일 참조 / 애니메이션 효과
1)글자나 그림 같이 이벤트 프로퍼티가 없는 위젯에 이벤트를 적용하고 싶을 때는 **GestureDetector**혹은 **InkWell**을 사용한다. 이 두 위젯은 터치 이벤트를 발생시키고 **onTap() 프로퍼티**에 이벤트를 작성한다. InkWell 위젯으로 감싸고 클릭하면 물결 효과가 나타나지만 GestureDetector 위젯은 그렇지 않다.  
2)**Hero**위젯은 화면 전환시 자연스럽게 연결되는 애니메이션을 지원하여 그림을 탭하면 애니메이션되며 자연스러운 화면 전환이 이루어진다. Hero위젯은 애니메이션 효과의 대상이 되는 양쪽 화면의 위젯을 Hero 위젯으로 감싸고, tag 프로퍼티를 반드시 동일하게 지정한다. Hero위젯은 반드시 **child를 가져야한다**. 또한 Hero로 전환된 화면을 GestureDetector로 감싸고 onTap 이벤트로 Navigator.pop(context)를 하면 화면이 다시 돌아온다.  
3)**AnimatedContainer**위젯은 한 화면 내에서 setState() 함수를 호출하여 화면을 새로 그릴 때 변경된 프로퍼티에 의해 애니메이션 되도록 해준다. Container 위젯과 쓰임새는 비슷하지면 **duration**프로퍼티는 필수이며, 애니메이션되는 데 걸리는 시간을 Duration 클래스를 사용해 정의할 수 있다. **Curves**클래스에는 미리 정의된 여러 애니메이션 효과가 있다.  
4)**SliverAppBar**와 **SliverFillRemaining**은 화면 헤더를 동적으로 표현하는 위젯이다. 헤더를 위로 스크롤하면 헤더 부분이 작아지면서 헤더 하단에 있던 정적인 내용만 보이는 AppBar 형태로 애니메이션 되는데 이런 효과를 **Sliver효과**라고 한다. SliverAppBar는 Scaffold의 AppBar를 지정하지 않고, body에 CustomScrollView인스턴스를 지정하고, slivers프로퍼티에 SliverAppBar와 SliverFillRemaining위젯을 설정한다. SliverAppBar위젯의 Sliver 효과를 위한 최소한의 프로퍼티는 **pinned(축소시 상단에 AppBar가 고정되는지 설정)**, **expandedHeight(헤더의 최대높이)**, **flexibleSpace(늘어나는 영역의 UI 정의)** 3가지 이다.   
4-1) flexibleSpace 위젯은 title과 background 프로퍼티를 활용하여 적절히 AppBar 영역이 확장되었을 때의 UI를 작성한다.  
4-2) SliverFillRemaining 위젯에는 **스크롤 영역에 표시될 화면**을 정의한다. child에 작성한 내용의 크기가 작아도 SliverAppBar 부분이 축소될 때 딱 하나의 크기가 알아서 결정된다.  
5)ListView를 사용하여 Sliver 효과를 주고 싶다면 ListView 대신 **SliverList**를 사용한다.  

# 기본 위젯6 / widgets6.dart 파일 참조 / 내비게이션  
1)**push**로 새로운 화면을 호출한다.
```dart
    onPressed: () async {
              final person = Person('홍길동',20);
              final result = await Navigator.push(context,MaterialPageRoute(builder: (context)=>SecondClass(person:person)));

              print(result);
            },
```
   1-1)첫 번째 인수로 context가 필요하고, 두 번째 인수로 MaterialPageRoute 인스턴스가 필요하다. MaterialPageRoute 클래스는 안드로이드와 iOS 각 플랫폼에 맞는 화면 전환을 지원해주고, builder 프로퍼티에는 BuildContext 인스턴스를 인수로 받고 이동할 화면의 클래스 인스턴스를 반환하는 함수를 작성한다.  
   1-2)push()메서드는 **Future**타입의 반환 타입을 가진다. 미레에 값이 들어올 것을 나타내는 클래스로 **await 키워드**를 메서드 실행 앞에 추가하고, await 키워드를 사용하는 메서드의 인수와 함수 본문 사이에 **async 키워드**를 추가한다. 어떤 일이 끝날 때까지 기다리면서 앱이 멈추지 않도록 하는 방식을 **비동기 방식**이라고 한다.
2)**pop**으로 이전 화면으로 이동한다.  
```dart
     onPressed: (){
              Navigator.pop(context,'ok');
            },
```  
Navigator.push() 메서드로 새로운 화면이 표시되어도 이전 화면은 메모리에 남게 된다. 이때 Navigator.pop() 메서드로 현재 화면을 종료하고 이전 화면으로 돌아갈 수 있다. 
3)**@required**를 붙이면 필수 입력 인수를 나타낸다.  
4)**routes**를 활용하여 내비게이션을 더 효율적으로 구성할 수 있다.  
5)push()메서드로 새로운 화면이 실행되고 pop() 메서드로 이전 화면으로 돌아간다. 실행되는 화면은 **스택**구조로 메모리에 쌓이게 된다.  
6)**StatefulWidget** 클래스의 내비게이션 동작은 기존에 메모리에 남아 있던 화면도 모두 새로 그리는 동작을 취한다. 그렇기 때문에 StatefulWidget 클래스의 build() 메서드에서는 앱 성능에 지장을 줄만한 코드를 작성하면 안 된다.  
7)위의 문제를 해결하기 위해, initState() 메서드를 사용한다. **initState()**메서드는 위젯이 생성될 때 호출이 되고, **dispose()**메서드는 위젯이 완전히 종료될 때(pop될 때) 호출된다. 계산이나 네트워크 요청 등의 로직은 build() 메서드가 아닌, initState() 메서드에서 수행해야 한다. StatefulWidget 클래스에는 build() 메서드 외에도 특정 타이밍에 실행되는 여러 메서드가 있는데 이러한 메서드들을 **생명주기** 메서드라고 부른다.  

# 복잡한 UI 작성(1) 
  1) 내비게이션바, CarouselSlider, ListView를 활용한 UI
  ---------------------------  
  1-1)AppBar의 centertitle 프로퍼티로 앱바의 가운데 글자를 위치할 수가 있다.  
  1-2)전체 테마를 변경할 때는 MaterialApp 클래스의 theme 프로퍼티를 설정해준다.  
  1-3)AppBar 위젯의 **actions 프로퍼티**를 이용하여 위젯의 리스트를 정의하여 간단히 메뉴를 추가할 수가 있다.  
      1-4)Column의 mainAxisAlignment 프로퍼티를 MainAxisAlignment.spaceEvenly로 해주면 서로 적절한 간격을 둔다.  
      1-5)**Opacity**위젯을 사용하여 투명도를 0.0~1.0 사이로 설정한다. 0.0은 완전히 투명한 상태여서 위젯이 위치해 있지만, 보이지 않게 된다.  
      1-6)**PageView** 위젯을 사용해 **carousel_slider**라이브러리를 사용하여 자동 스크롤 지원 기능을 사용할 수 있다.  
      1-7)CarouselSlider의 options프로퍼티에서 CarouselOptions()를 통해 height와 autoPlay를 조절할 수 있다.  
      1-8)**ClipRRect** 위젯을 통해 child를 둥근 사각형으로 만든다. borderRadius 프로퍼티를 통해 모서리를 얼마나 둥글게 할지 설정하고, child로 Image를 asset 해준다.  
      1-9)ListView를 사용할 때, 스크롤이 가능한 객체 안에 다시 스크롤 객체를 넣는 경우(ListView 위젯 안에 ListView 위젯이 들어간 상황)에는 **shrinkWrap**프로퍼티를 true로 설정해줘야 한다.  
      1-10)스크롤 안에 스크롤을 넣는 경우로 안쪽 스크롤을 막아서 정상 동작이 되도록 ListView 위젯의 **physics 프로퍼티**에 NeverScrollableScrollPhysics 클래스의 인스턴스를 설정한다. 이것으로 이 리스트는 스크롤 기능이 정지되어 바깥쪽 스크롤이 정상적으로 동작하게 된다.  
      
# 복잡한 UI 작성(2)
   2) TextFormField, Form, Navigator를 활용한 UI
   --------------------------------------------
   2-1)사용자에게 값을 입력받을 때는 **TextField** 위젯또는 **TextFormField**위젯을 사용한다. **TextEditingController** 클래스의 인스턴스를 통해 TextField 위젯에 작성된 값을 얻을 수 있다.  
   2-2)화면이 종료될 때는 반드시 위젯 트리에서 컨트롤러를 해제해야 한다.  
   2-3)TextField 위젯에서는 controller 프로퍼티에 컨트롤러 변수를 설정한다. 이렇게 하면 TextEditingcontroller()로 생성된 인스턴스를 이용하여 TextField 인스턴스의 값을 얻거나 변경된 값을 모니터링 할 수 있다.  
   2-4)TextField 위젯의 값이 변경될 때마다 무언가를 수행하고 싶다면 **addListener()**메서드를 사용한다.  
   2-5)**Form**과 **TextFormField**를 사용하여 사용자 입력값을 검증한다.  
   2-6)**TextFormField**위젯은 TextField 위젯이 제공하는 기능에 추가로 **validator** 프로퍼티를 활용한 검증 기능도 제공한다.  
   2-7)검증에는 TextFormField 위젯을 사용하며, 검증할 내용 전체를 Form 위젯으로 감싼다. Form 위젯에는 유니크한 키를 지정해야 하며 **GlobalKey<FromState> 인스턴스**를 키로 사용한다.  
   2-8)폼의 검증으로 **_fromKey.currenState.validate()**로 수행하며 true 또는 false 값을 반환한다.  
   2-9)**trim()**메서드는 앞뒤 공백을 제거해준다.  
   2-10)TextFormField 위젯의 decoration 프로퍼티를 사용하여 InputDecoration 클래스를 설정하여 외곽선, 힌트 등을 설정한다.  
   2-11)TextField에 입력한 내용은 정수로 입력해도 문자열로 저장이 되기 때문에 문자열을 double 타입으로 전달받으려면 **double.parse()**함수를 사용해야 한다.  

#복잡한 UI 작성(3)  
   3) Timer를 이용하여 스탑워치 만들기
   ---------------------------------
   3-1)**BottomAppBar** 위젯은 하단에 배치하는 AppBar이다. Scaffold 위젯의 bottomNavigationBar 프로퍼티에 배치하는 것이 일반적이고, FloatingActionButton 위젯과도 자연스럽게 어울린다. BottomAppBar 위젯 자체로는 아무것도 없는 빈 영역이고, 일반적으로 하단 메뉴와 FloatingActionButton 위젯을 함께 사용하는 경우에 사용된다.  
   3-2)특정 위치에 위치시키기 위해서는 **Positioned** 위젯을 사용한다.  
   3-3)Timer 클래스는 dart:async 패키지에 포함된 클래스이다.
   ```dart
   Timer.periodic(Duration(milliseconds:10),(timer){ //0.01초에 한 번씩 작업을 수행
   ///할 일})
   ```
   3-4)**map()** 함수는 기존 값을 다른 형태로 변환해준다. map() 함수를 사용하여 Text 위젯으로 감싸고 toList()로 다시 리스트 형태로 변환을 했다. 
