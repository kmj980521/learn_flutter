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
22)**계단식 표기법(..)** 을 사용

