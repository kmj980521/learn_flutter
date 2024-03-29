# 공부용입니다. 
## README.md 수정 예정

<details><summary> dart 
</summary>

## 실행 도중 타입 판별
- **프로퍼티.runTimeType**

## optional parameter - 있어도 되고, 없어도 되는 파라미터 

```dart
void main(){
  print(addNumbers(10)); // y는 defalut로 20, z는 default로 30의 값을 가진다. 
}

addNumbers(int x, [int y = 20, int z = 30 ]) // y와 z는 있어도 되고, 없어도 되는 값. 만약 [int y, int z] 만 있으면 x와 z에 null 값이 올 수 있기 때문에 적절한 처리를 해준다
{
  return x+y+z;
}

```

## named parameter - 이름이 있는 파라미터로 순서가 중요하지 않다 

- required 키워드가 붙으면 값을 지정해서 넣어줘야 한다


```dart

void main(){
  print(addNumbers(x:10,y:30,z:50));
  print(addNumbers(y:50, x:30));
}

addNumbers({
  required int x,
  required int y,
  int z = 30,
  
}) {
  return x+y+z;
}

```


## typedef

```dart

void main(){
  int result3 = calculate(30,40,50,add);
  print(result3);
}

typedef Operation = int Function(int x, int y, int z);


int add(int x, int y, int z) => x+y+z;

int subtract(int x, int y, int z) => x-y-z;


int calculate(int x, int y, int z, Operation operation){
  return operation(x,y,z);
}

```

</details>
  
<details><summary>OOP
</summary>  
  
## 클래스 선언

```dart

  class Idol{
  final String name;
  final List<String> members ; // immutable 프로그래밍을 위해 final을 작성한다
  
  const Idol(this.name, this.members);

  // named constructor
  Idol.fromList(List values): this.members = values[0], this.name = values[1];
}
```


- const를 사용하여 클래스 선언 및 인스턴스 공유 

```dart

void main() {
  // const로 선언하면 이름만 다른 클래스를 선언해도 같은 인스턴스가 된다
  Idol blackPink =const Idol(
      '블랙핑크',
    ['지수','제니','리사','로제']
  );
  Idol blackPink2 =const Idol(
      '블랙핑크',
    ['지수','제니','리사','로제']
  );
 }

```

## getter / setter 

```dart
void main(){
  print(blackPink.firstMember);
  print(bts.firstMember);
  blackPink.firstMember = "코팩";
  bts.firstMember = "아이언맨";
  print(blackPink.firstMember);
  print(bts.firstMember);
}


class Idol{
  // getter
  String get firstMember{
    return this.members[0];
  }
  
  // setter
  // 요즘은 final로 변수값 변경을 못하게끔 하기 때문에 setter를 쓰지 않는 추세이다 
  set firstMember(String name ){
    this.members[0] = name;
  }

}

```

## private 

- 클래스 이름 앞에 _ (underscore)를 붙인다

- 같은 파일에서만 가능하다




## generic

```dart

  void main() {
  
  Lecture<String,String> lecture1 = Lecture('123','lecture1');
  lecture1.printType();
  
  Lecture<int,String> lecture2 = Lecture(123,'lecture2');
  lecture2.printType();
}


class Lecture<T, E>{
  final T id;
  final E name;
  
  Lecture(this.id, this.name); 
  
  
  void printType(){
    print(id.runtimeType);
  }
}

```


## 형 변환

```dart

void main() {
 
  List<String> numbers = ['1','2','3','4','5'];
  print(numbers.asMap());
  print(numbers.toSet()); // Set 형태로 
  
  
  Map numbersMap = numbers.asMap(); // Map 형태로 
  print(numbersMap.keys);
  print(numbersMap.values.toList()); // List 형태로 
  
  
  Set numbersSet = Set.from(numbers); // Set 형태로 
  


```
  
</details>

<details><summary>Functional Programming
</summary>  
  
# Functional Programming 


## Map

```dart

void main() {
 
  List<String> numbers = ['1','2','3','4','5'];
  
  final newNumbers = numbers.map((x){
    return '숫자: $x';
  }); // x 파라미터를 받고, return 한 값이 대체된다 
  print(newNumbers.toList()); // 원래는 iterable 형태 
        
  final newNumbers2 = numbers.map((x) => '숫자 $x');
  print(newNumbers2);
  
  String numbers2 = '13579';
  final parsed = numbers2.split('').map((x)=>'$x.jpg').toList(); // 문자 단위로 split하고, list이니 map으로 값을 바꿔 iterable 형태로 만든 후 List로 만든다 
  
  print(parsed);
}

```

- Map을 사용하면 계속 새로운 리스트가 나온다 


```dart

void main() {
 
  Map<String, String> harryPotter= {
    'Harry Potter' : '해리포터',
    'Ron Weasley' : '론 위즐리',
    'Hermione Granger' : '헤르미온느 그레인저'
  };
  
  // Map to Map
  final result = harryPotter.map(
  (key, value) => MapEntry(
    'Harry Potter Character $key',
    '해리포터 캐릭터 $value'
    )
  );
  print(result);
  
  
  // Map to List
  final keys = harryPotter.keys.map((x) => 'HPC $x').toList();
  final values = harryPotter.values.map((x) => '해리포터 $x').toList();
  
  print(keys);
  print(values);
}

```

- Map은 key-value가 한 쌍으로 온다

- MapEntry를 이용하여 새로운 Map을 만든다 


## where

- 조건식으로 true, false를 반환하고 true면 그 값을 keep 한다 

- 필터링 기능으로 사용한다 

```dart

void main() {
 
  List<Map<String,String>> people = [
    {
      'name' : '홍길동',
      'group' : 'Man'
    },
    {
      'name' : '강감찬',
      'group' : 'Man'
    },
    {
      'name' : '이순신',
      'group' : 'Man'
    },
    {
      'name' : '유관순',
      'group' : 'Woman'
    },
    
  ];
  
  // where는 조건 
  final s = people.where((x)=> x['group'] == 'Man');
  print(s);
}

```

## reduce 

```dart

- 맨 처음에는 첫 파라미터에는 리스트의 첫 번째 값, 두 번째 파라미터에는 리스트의 두 번째 값이 들어간다

- 그 다음부터는 이전에 구했던 total이 prev가 된다. 이전 함수에서 return 해준 값이 다음 함수를 실행할 때의 첫 번째 파라미터 값이 된다.  
void main() {
 
  List<int> numbers = [
    1,
    3,
    5,
    7,
    9,
  ];
 
  // final result = numbers.reduce((prev,next) => prev + next);
   
  final result = numbers.reduce((prev,next){
    print('--------');
    print('previous : $prev');
    print('next : $next');
    print('total : ${prev+next}');
    
    return prev + next;
  });
  print(result); // 25
}

```

- reduce는 반환되는 값의 타입이 각각의 태초가 된 리스트의 타입과 똑같아야 한다



## fold

- Generic으로 반환받을 값을 작성해준다
- 시작값, (함수)
- 맨 처음 실행했을 때 prev에는 시작값을, next에는 리스트의 첫 번째 값을 받고, 그 후에는 prev는 이전 함수에서 return 받은 값이 된다

```dart

void main() {
 
  List<int> numbers = [1,3,5,7,9];
  
  final sum = numbers.fold<int>(0, (prev,next) => prev + next);
  
  print(sum);
  
  List<String> words = [
    '안녕하세요 ',
    '반갑습니다 ',
    '환영합니다. '
  ];
  
  final sentence = words.fold<String>('',(prev,next) => prev + next);
  print(sentence);
  
  final count = words.fold<int>(0,(prev,next) => prev + next.length);
  print(count);
  
}

```

## Cascading Operator

- **...키워드** 를 사용한다
- 리스트 안에 값을 풀어놓는 역할을 한다 

- ...을 사용하면 완전히 새로운 리스트에 값을 풀어놓는 것이다

```dart

void main() {
  List<int> even = [2,4,6,8];
  
  List<int> odd = [1,3,5,7]; 
 
  print([...even, ...odd]); // 완전히 새로운 리스트가 된다 
  
}

```

## 모두 적용

```dart

final parsedPeople = people.map(
  (x) =>Person(
     name : x['name']!,
     group : x['group']!,
    )
  ).where((x) => x.group=='BTS').toList();

```

  </details>  
  

<details><summary>Asynchronous Programming
</summary>  
  
# Asynchronous Programming - 비동기 프로그래밍 

## Future 

`Future.delayed( delaytime, method(){})`

- 2개의 파라미터가 필요하다


- 첫 번째 파라미터는 지연할 기간을 의미하고 (얼마나 지연할 것인지) Duration 클래스를 사용한다
- 두 번째 파라미터는 지연 시간이 지난 후 실행할 함수이다 

```dart

void main() {
  // Future -> 미래에 받아올 값을 저장 
  
  
  Future<String> name = Future.value('코팩');
  
  Future<int> number = Future.value(1);
  
  Future<bool> isTrue = Future.value(true);
  
  addNumbers(1,1);
  addNumbers(2,2);
  
}

void addNumbers(int number1, int number2){
  print('계산 시작: $number1 + $number2');
  
  //서버 시뮬레이션
  Future.delayed(Duration(seconds :2), (){
    print('계산 완료: $number1 + $number2 = ${number1+number2}');
  });
  print('함수 완료');
}

```

![image](https://user-images.githubusercontent.com/61898890/160042640-c5d1c716-b578-4288-b8d9-14b2d4b2a82b.png)


## Await

- 함수 구현부분 전에 async를 써준다

- async와 await 키워드를 사용함으로 코드 실행을 실제로 논리적으로 순서대로 실행되도록 한다

- **await 키워드** : await 다음 코드는 현재 코드가 끝나기 전에는 실행하지 않게 한다. async 코드를 논리적으로 기다릴 수 있다

- 실제로 CPU가 멈추지 않고, 보이는 것만 순차적으로 하게 보인다

```dart
 
void addNumbers(int number1, int number2)  async {
  print('계산 시작: $number1 + $number2');
  
  //서버 시뮬레이션
  await Future.delayed(Duration(seconds :2), (){
    print('계산 완료: $number1 + $number2 = ${number1+number2}');
  });
  print('함수 완료: $number1 + $number2');
}

```

- main에 async를 붙여 한 코드가 순사적으로 실행되게끔 

- async로 받는 반환 값은 Future 타입이므로 함수 본체의 반환 타입을 바꾼다

```dart

void main() async{
  // Future -> 미래에 받아올 값을 저장 
  
  
  Future<String> name = Future.value('코팩');
  
  Future<int> number = Future.value(1);
  
  Future<bool> isTrue = Future.value(true);
  
  await addNumbers(1,1);
  
  await addNumbers(2,2);
  
}
// 함수 구현부분 전에 async를 써준다. 
// async와 await 키워드를 사용함으로 코드 실행을 실제로 논리적으로 순서대로 실행되도록 한다
Future<void> addNumbers(int number1, int number2)  async {
  print('계산 시작: $number1 + $number2');
  
  //서버 시뮬레이션
  await Future.delayed(Duration(seconds :2), (){
    print('계산 완료: $number1 + $number2 = ${number1+number2}');
  });
  print('함수 완료: $number1 + $number2');
}

```

![image](https://user-images.githubusercontent.com/61898890/160043646-15f821c4-1a9a-46e5-9a50-96009cda43da.png)


- Future<> 타입을 반환하는 함수에서 return을 사용하여 값을 반환해도 된다.(자동으로 Future로 감싸서 반환해준다)


## Stream 

- **yield 키워드** 를 사용하여 stream이 완료가 되기 전에 값을 계속 받아올 수 있다 

- async 패키지를 import 한다 

- StreamController를 만들고, controller의 stream을 선언한다

- stream에는 listen()이라는 메서드가 존재하고 val 값은 매번 새로 들어오는 값을 의미하고, 값이 들어올 때마다 새로 수행할 함수를 정의한다 

```dart

import 'dart:async';


void main() {

  final controller = StreamController();
  final stream = controller.stream;
  
  final streamListener1 = stream.listen((val){
    print('Listener 1 + $val');
    
  }); // 값을 들어올 때마다 함수가 실행 
  
  controller.sink.add(1); // sink에 1을 삽입
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);
  
}

```

- `controller.stream` : 1번의 listener만 생성이 가능하다

- `controller.stream.asBroadcastStream();` : BroadCastStream으로 바꾸며 여러번 listener를 등록하게 한다


### 비동기 프로그래밍에 함수형 프로그래밍을 접목시키기 

```dart

final streamListener1 = stream.where((val)=>val %2 == 0).listen((val){
    print('Listener 1 + $val');
  }); // 값을 들어올 때마다 함수가 실행 
  
  final streamListener2 = stream.where((val)=>val %2 == 1).listen((val){
    print('Listener 2 + $val');
  });

```

### 값을 Stream으로 계속 보내주기 

- async* 키워드를 사용하여 Stream을 사용한다 
- 반환 값 또한, Stream<>로 선언한다 

- 중간중간 return 되는 값들은 **yield 키워드**를 사용한다 


```dart

import 'dart:async';


void main() {
  calculate(1).listen((val){
    print('calculate(1): $val');
  });
}

Stream<int> calculate(int number) async* {
  for(int i=0; i<5; i++){
    yield i * number;
  }
}

```


### Stream에서의 async 프로그래밍 


- `await Future.delayed(Duration(seconds:1));` : 코드를 추가해 async 프로그래밍을 구현한다 

- ' yield* ' 은 해당하는 스트림의 모든 값을 다 가져온다  - await와 비슷하다

```dart

void main() {
  playAllStream().listen((val){
    print(val);
  });
}

// 
Stream<int> playAllStream() async*{
  yield* calculate(1);
  yield* calculate(1000);
}


Stream<int> calculate(int number) async* {
  for(int i=0; i<5; i++){
    yield i * number;
    
    await Future.delayed(Duration(seconds:1));
  }
}

```

</details>
















<details><summary>내용을 더 깔끔하게 수정할 예정입니다
</summary> # learn_flutter

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
- int와 double은 **num**타입에 포함된다.  
- **var**를 사용해 타입을 직접 명시하지 않고 타입 추론을 한다.  
- 상수는 **fianl**키워드를 사용한다.  
- **assert()** 함수는 계산 결과가 참인지 검사한다.  
- **is** 키워드는 타입을 검사한다.
```dart
int a = 10;
      if (a is int){
        print('정수');
}
```
- **as** 키워드는 형변환을 한다. 단, 다른 타입끼리는 변환이 안 되고 더 상위 개념으로만 변환이 가능
```dart
var c = 30.5;
int d = c as int; //에러 int와 double은 모두 num을 구현하는 타입이지만 서로는 관계가 없기 때문에 형변환이 불가능.
------------------
dynamic d =30.5;
num n = d; //as num; 생략 가능. int와 double 모두 상위 개념인 num으로 형변환할 수 있다.
```
- **static**키워드는 클래스 내부에 선언된 함수더라도 정적 메서드가 되며 함수로 볼 수 있다. 최상위 함수처럼 사용할 수 있다.  
- **람다식 표현** 
```dart
(number)=>number%2 == 0; //number가 짝수인지 판별
```
- **선택 매개변수**. 함수 정의에서 {}로 감싼 매개변수는 선택적으로 사용할 수 있다. 호출할 때 매개변수명을 값 앞에 써주면 되는데 이런 매개변수를 **이름 있는 매개변수**라고 한다.
```dart
void something(String name, {int age}){} //int age = 10과 같이 기본값을 지정할 수도 있다.
void main(){
something('홍길동',age:10); //ok
something('홍길동'); //ok
something(age:10); //error name은 필수로 들어가야함.
something(); //error name은 필수로 들어가야함. 
}
```
- **객체(object)**란 저장 공간에 할당되어 값을 가지거나 식별자에 의해 참조되는 공간. 이러한 객체를 메모리에 작성하는 것을 **인스턴스화**한다고 한다. 메모리에 작성된 객체를 **인스턴스**라고 하고, 인스턴스화하기 위해서는 설계도가 필요한데 설계도 역할을 하는 것이 **클래스**이다. 클래스 안에는 속성을 표현할 수 있는데 이를 **프로퍼티**라고 한다.  
- **new**키워드를 사용해 인스턴스화 시키고, **.연산자**를 통해 객체의 프로퍼티에 접근할 수 있다.  
- 변수명 앞에 **_ 기호 **를 붙이면 외부에서 접근이 불가능 해진다.(private) 이러한 메서드를 접근하기 위해서 **게터**와 **세터**메서드를 작성해야 한다.  
```dart
class Rectangle{
num left, top, width, height;
Rectangle(this.left, this.top, this.width, this.height);

num get right => left + width; //오른쪽 점을 알기 위해 right는 left와 width를 더한 값을 반환한다. 
set right(num value) => left = value - width; //오른쪽 점을 설정하기 위해 원하는 위치값 value를 매개인자로 받아 value에서 width를 뺀 값을 left에 할당한다.
```
}
- 상속은 **extends**키워드를 사용하여 부모 클래스의 기존 기능을 재정의할 때 사용한다.  
- 추상클래스는 **abstract**키워드를 사용하고, 추상 클래스는 그대로 인스턴스화할 수 없으며, 다른 클래스에서 **임플리먼트**하여 기능을 완성하는 상속 재료로 사용되고, 대상 클래스에는 **implements**키워드를 사용하고, 메서드에는 **@override**키워드를 사용한다. 여러 추상 클래스를 한 번에 임플리먼트할 수도 있으나 추상 클래스를 구현할 때는 모든 추상 메서드를 꼭 재정의해야 한다.
- **믹스인**. **with**키워드를 사용하면 상속하지 않고 다른 클래스의 기능을 가져오거나 오버라이드할 수 있다. **다형성**이라고도 한다.
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
- 다트는 List, Map, Set등의 **컬렉션**을 제공한다.  
  16-1) List : 같은 타입의 자료를 여러 개 담을 수 있고 특정 인덱스로 접근이 가능하다. **스프레드 연산자**(...)를 사용해 다른 컬렉션 안에 컬렉션을 삽입할 때 사용한다.
```dart
      List<dynamic> list = [1,2,3,'hello']; //dynamic은 모든 타입을 대변하는 특수한 타입.
      var items =['mon','tue','wed'];
      
      final items = [1,2,3,4];
      final mynum = [...items,5,6];
      print(mynum); //1,2,3,4,5,6
```
-  Map : 순서가 없고 탐색이 빠른 자료구조 컬렉션이고, **키**와 **값**의 쌍으로 이루어져 있어 키를 이용하여 값을 빠르게 얻을 수 있다. 만약 요청한 키에 해당하는 값이 없다면 값 없음을 의미하는 null을 반환한다.
```dart
      var cityMap {
            '한국':'부산',
            '일본':'도쿄'
      }
      cityNap['미국']='워싱턴'; //새로운 값 추가
```      
 - Set : 집합을 표현하는 자료구조 컬렉션이고, **add(), remove()**메서드로 집합에 추가하거나 삭제를 하고, **contains()**메서드는 찾고자 하는 자료가 집합에 있는지 없는지 **불리언 타입**으로 반환한다. 리스트와는 다르게 중복을 허용하지 않는다.
```dart
      var citySet = {'서울','수원','오산','부산'};
      citySet.add('안양');
      citySet.remove('수원');
      print(citySet.contains('서울')); //true
``` 
- dart는 **객체 지향 프로그래밍**과 **함수형 프로그래밍**의 특징을 모두 제공한다.  
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
-  for문은 **외부반복** forEach문은 **내부반복**을 수행한다. 
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
- **where** 키워드는 조건을 필터링할 때 사용하는 함수이며, **map**함수는 반복되는 값을 다른 형태로 변환하는 방법을 제공하는 함수이다. .연산자를 찍고 연속적으로 사용하는    **메서드 체인**을 지원한다.
```dart
void main(){
  final list = [1,2,3,4,5];
  
  list.where((item)=>item%2==0).forEach(print); //item이 짝수면 print를 한다.
  
  list.where((item)=>item%2==0).map((item)=>'숫자 $item').forEach(print); //짝수를 찾아 그 짝수에 숫자 문자열을 붙이고 print한다.
  
}
```  
- **toList**는 결과를 리스트로 저장하고, 만약 중복되는 값을 제거한 리스트를 얻고 싶으면 **toSet**를 사용해 세트로 저장을 한다.
```dart
void main(){
  final list = [1,2,2,3,3,4,5];
  
  final result_list=list.where((item)=>item%2==0).toList();
  
  final result_set=list.where((item)=>item%2==0).toSet();
  print(result_list); //[2, 2, 4]
  print(result_set); // (2, 4)
}
```  
- **any**함수는 리스트에 특정 조건을 충족하는 요소가 있는지 없는지 계산을 할 때 사용한다.   
- **계단식 표기법..** 을 사용하여 동일 객체에서 일련의 작업을 수행하고, 매번 리스트가 반환되어 임시 변수를 만드는 단계를 절약시키고 더 유동적인 코드를 작성할 수 있다.
```dart
void main(){
  final list=[1,2,3,4,5];
  
  print(list..add(6)..remove(2)); //1,3,4,5,6
}
```  
- **?.** 연산자를 이용하여 null 여부를 간단히 판단할 수가 있다. 객체의 프로퍼티나 메서드에 접근할 때 . 연산자 대신 ?. 연산자를 사용하면 **객체가 null일 때 에러를 발생하는 대신 null을 반환**한다.  
**??** 연산자는 객체가 null일 때 작동을 간단히 구현하는 데 사용한다. 
```dart
void main(){
  String name= null;
  print(name?.length); //null 출력
  print(name?.length ?? 0);// name.length의 길이를 판별하는데 이때 name은 null이다. 즉 name이 null이면 ??를 통해 null을 판별하고 0을 출력한다. -> 0출력
}
```

# flutter 기본적인 앱 구조  
- **StatelessWidget 클래스**는 상태를 가지지 않는 위젯을 구성하는 기본 클래스이다. 상태를 가지지 않는다는 것은 한 번 그려진 후 다시 그리지 않는 경우이며, 이러한 클래스는 프로퍼티로 변수를 가지지 않는다.(상수는 가질 수 있다.) / **build()** 메서드는 위젯을 생성할 때 호출되는데, 실제로 화면에 그릴 위젯을 작성해 변환한다.  
- **MaterialApp**클래스는 title, theme, home등등의 인수를 가진다. tilte은 제목, theme은 테마, home은 작성하는 위젯이 실제 이 앱이 표시하는 위젯이 된다.  
- **StatefulWidget 클래스**는 StatefulWidget 클래스에서 상속받은 createState()메서드를 재정의하여 클래스의 인스턴스를 반환한다. 이 메서드는 StatefulWidget이 생성될 때 한 번만 실행이 된다. State클래스를 상속받은 클래스를 **상태 클래스**라고 한다. 상태 클래스는 변경 가능한 상태를 프로퍼티 변수로 표현하고, 이 변수의 값을 변경하면 화면을 다시 그리게 된다.  
- 위젯 사이의 데이터 전달은 **생성자를 활용**한다. 상태 클래스에서 StatefulWidget 클래스에 접근하려면 widget 프로퍼티를 사용한다.  
```dart
MYHomePage({Key key, this.title}) : super(key: key);
...
title: Text(widget.title), //widget 프로퍼티 사용
```  
- **Scaffold**클래스는 머티리얼 디자인 앱을 만들 때 뼈대가 되는 위젯이다. 즉, 머티리얼 디자인 앱을 만든다면 MaterialApp -> Scaffold가 기본 형태이다.  
- Scaffold 클래스의 FloatingActionButton은 setState를 통해 상태를 변경해주고 리빌드한다.  

# 기본 위젯 / widgets.dart파일 참조
- 화면을 구성하는 컴포넌트를 **위젯**이라고 부른다.  
- **Container**는 아무것도 없는 위젯이고 다양한 프로퍼티를 가지고 있기 때문에 여러가지로 사용이 된다.  
- **Column**위젯과 **Row**위젯의 mainAxis와 crossAxis는 서로 다르다. Column은 세로가 mainAxis고, Row는 가로가 mainAxis이다. MainAxisSize를 통해 공간을 설정할 수 있고, MainAxisAlignment와 CrossAxisAlignment에 center, start, end, spaceEvenly, spaceBetween, spaceAround등을 통해 여백을 조절할 수 있다.  
- **Stack**위젯은 children에 나열한 여러 위젯을 순서대로 겹치게 한다. children 프로퍼티에 정의한 리스트에 먼저 작성한 위젯이 가장 아래쪽에 위치하고, 나중에 작성한 위젯이 위쪽에 위치하게 된다.  
# 기본 위젯2 / widgets2.dart 파일 참조
- **SingleChildScrollView**를 사용하여 Column에 나열된 위젯들이 화면 크기를 넘어서면 스크롤을 하게끔 한다. SingleChildScrollView는 하나의 자식 위젯을 가져야 하기 때문에 Column을 사용하여 스크롤을 구현할 수 있지만, Column은 표시할 위젯의 크기만큼 가로 길이를 가진다. 이때 **ListBody**를 사용하면 스크롤 가능 영역이 가로로 꽉 차기 때문에 사용자가 스크롤하기 더 편해진다.  
-  **ListView**위젯은 SingleChildScrollView와 ListBody의 조합과 동일한 효과를 내지만 좀 더 리스트 표현에 최적화된 위젯이다. ListView에 표시할 각 항목의 레이아웃은 직접 정의해도 되지만 리스트 아이템을 쉽게 작성할 수 있는 **ListTile**위젯을 사용하면 편리하다.  
- **GridView** 위젯을 사용하여 열 수를 지정하여 그리드뷰를 생성한다.
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
- **PageVeiw**위젯을 사용하여 여러 페이지를 좌우로 슬라이드하여 넘길 수 있도록 해준다. 
# 기본 위젯3 / widgets3.dart 파일 참조
- **DefaultTabController**로 Scaffold를 감싸고 Scaffold의 bottom에 TabBar를 통해 Tab의 리스트를 지정한다.  
- Scaffold의 bottomNavigationBar의 **BottomNavigationBar**를 사용해 하단 탭 바를 구성한다.  
- **Center**위젯을 사용해 중앙으로 정렬시킨다.  
- **Padding**위젯을 사용해 안쪽 여백을 표현한다. EdgeInsets 클래스를 사용하여 설정하고, 앞에 const를 붙이면 컴파일 타임에 상수로 정의되어 다시 사용되는 부분이 있을 경우에 메모리에 있는 값을 재사용하는 이득이 있다.  
- **Align**위젯을 사용하여 자식 위젯의 정렬 방향을 정할 수 있다. 
```dart
Align(
  alignment: Alignment.bottomRight,
  child: [위젯]
)
```
- **Expanded**위젯을 사용하여 자식 위젯의 크기를 최대한으로 확징시켜준다. 
- 위젯을 특정 크기로 만들고 싶을 때는 **SizedBox**위젯을 사용한다. 
- **Card**위젯을 사용하여 카드 형태의 모양을 만든다. 기본적으로 크기가 0이므로 자식 위젯의 크기에따라 크기가 결정된다. shape프로퍼티를 통해 RoundedRectangleBorder 클래스의 인스턴스를 지정해 카드 모서리의 둥근 정도를 실숫값으로 조정한다.  
- **RaisedButton**은 입체감을 가지는 일반적인 버튼 위젯이다. **FlatButton**은 평평한 형태의 버튼이다. **IconButton**은 아이콘을 표시하는 버튼이다. IconButton은 아이콘의 크기나 색을 지정할 수 있다. 또한, IconButton 위젯은 child 프로퍼티가 없는 대신 아이콘을 icon 프로퍼티에 작성하고 크기는 iconSize 프로퍼티로 설정한다.  
- **MediaQuery**를 사용하기 위해서는 Builder를 활용한다.
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
- **Text** 위젯을 사용하여 글자를 표시한다. Textㅇ 위젯은 기본적으로 첫 번째 인수에 문자열을 지정하고, **style 프로퍼티에 TextStyle 클래스의 인스턴스를 지정**하여 다양한 글자를 표현한다.  
- **Image**위젯을 사용하여 이미지를 표시한다. **Image.network('url')** 를 사용해도 되고, pubspec.yaml 파일에서 assets를 수정해도 된다.  
- **Icon**위젯을 사용하여 여러가지 아이콘을 표시한다. 아이콘 위젯은 단독으로도 사용하지만 메뉴나 리스트, 버튼과의 조합으로 사용된다. 머터리얼 디자인용 기본 아이콘들은 **Icons** 클래스에 상수로 정의되어 있다.  
- **Progress** 위젯을 사용하여 로딩 중이거나 오래 걸리는 작업을 할 때 사용자에게 진행 중임을 보여주는 용도로 사용한다. 둥근 형태의 **CircularProgressIndicator()** 와 선 형태의 **LinearProgressIndicator()** 를 사용한다.  
- **CircleAvatar** 위젯을 사용하여 프로필 화면에 자주 사용하는 원형 위젯이다. 네트워크상에 존재하는 이미지를 표시한다면 child 프로퍼티가 아닌 backgroundImage 프로퍼티에 NetworkImage 클래스의 인스턴스를 지정해야 네트워크에서 받아온 이미지가 원형으로 표시된다.  

# 기본 위젯4 / widgets4.dart 파일 참조 / 입력용 위젯
- **TextField()** 위젯을 통해 글자를 입력받고, InpuDecoration 클래스와 함께 사용하여 힌트 메시지나 외곽선등의 꾸밈 효과를 추가한다.  
- **CheckBox**와 **Swtich** 위젯을 통해 설정 화면 등에 많이 사용되는 체크박스, 라디오 버튼, 스위치를 표현한다. 이 둘은 상태를 나타낼 **불리언 타입의 변수가 필요**하고 **value 프로퍼티에 설정**한다. **onChanged** 이벤트는 체크값이 변할 때마다 발생하므로 StatefulWidget이어야 하며, **setsState()**를 통해 value 프로퍼티에 지정한 변숫값을 변경하여 UI를 다시 그린다.  
- **Radio**와 **RadioListTile**위젯을 통해 선택 그룹 중 하나를 선택할 때 사용한다. 어디까지를 터치 영역으로 볼 것이냐에 따라 Radio를 사용하거나 RadioListTile을 사용한다. Radio 그룹 내에서 하나만 선택을 하기 때문에 그룹이 되는 항목을 열거형(enum)으로 정의하고 **groupValue 프로퍼티**에 열거형으로 정의한 변수를 지정하고, onChanged 이벤트에서 변경된 값을 반영한다. RadioListTile은 가로 전체가 터치 영역이 된다.  
- **DropDownButton** 위젯은 여러 아이템 중 하나를 고를 수 있는 콤보박스 형태의 위젯이다. value 프로퍼티에 표시할 값을 지정하고, items 프로퍼티에는 표시할 항목을 DropdownMenuItem 클래스의 인스턴스들을 담은 **리스트로 지정**해야 한다.  
- **AlertDialog**위젯은 머티리얼 디자인의 유저 확인용 다이얼로그 위젯이다. AlertDialog를 표시하려면 showdialog() 함수의 builder 프로퍼티에 AlertDialog 클래스의 인스턴스를 반환하는 함수를 작성하면 된다. showDialog() 함수의 barrierDismissible 프로퍼티는 다이얼로그 바깥 부분을 터치해도 닫히게 할 것인지 정한다. title은 제목, content는 내용, actions프로퍼티는 Navigator를 설정한다.  
- **DatePicker** 위젯을 통해 날짜를 선택한다. showDatePicker() 함수를 호출해야하며, 함수의 프로퍼티에는 context를 인수로 전달하고, initialDate는 초기 선택값, firstDate와 lastDate는 DatePicker에 표시할 날짜의 범위를 정하고, builder 프로퍼티는 테마를 설정할 때 사용한다.  
- **TimePicker** 위젯을 사용하여 시간을 선택한다. initialTime 프로퍼티에는 초기값을 지정하고, context가 필요하며, Future 타입으로 TimeOfDay 타입의 값을 반환한다.  

# 기본 위젯5 / widgets5.dart 파일 참조 / 애니메이션 효과
- 글자나 그림 같이 이벤트 프로퍼티가 없는 위젯에 이벤트를 적용하고 싶을 때는 **GestureDetector**혹은 **InkWell**을 사용한다. 이 두 위젯은 터치 이벤트를 발생시키고 **onTap() 프로퍼티**에 이벤트를 작성한다. InkWell 위젯으로 감싸고 클릭하면 물결 효과가 나타나지만 GestureDetector 위젯은 그렇지 않다.  
- **Hero**위젯은 화면 전환시 자연스럽게 연결되는 애니메이션을 지원하여 그림을 탭하면 애니메이션되며 자연스러운 화면 전환이 이루어진다. Hero위젯은 애니메이션 효과의 대상이 되는 양쪽 화면의 위젯을 Hero 위젯으로 감싸고, tag 프로퍼티를 반드시 동일하게 지정한다. Hero위젯은 반드시 **child를 가져야한다**. 또한 Hero로 전환된 화면을 GestureDetector로 감싸고 onTap 이벤트로 Navigator.pop(context)를 하면 화면이 다시 돌아온다.  
- **AnimatedContainer**위젯은 한 화면 내에서 setState() 함수를 호출하여 화면을 새로 그릴 때 변경된 프로퍼티에 의해 애니메이션 되도록 해준다. Container 위젯과 쓰임새는 비슷하지면 **duration**프로퍼티는 필수이며, 애니메이션되는 데 걸리는 시간을 Duration 클래스를 사용해 정의할 수 있다. **Curves**클래스에는 미리 정의된 여러 애니메이션 효과가 있다.  
- **SliverAppBar**와 **SliverFillRemaining**은 화면 헤더를 동적으로 표현하는 위젯이다. 헤더를 위로 스크롤하면 헤더 부분이 작아지면서 헤더 하단에 있던 정적인 내용만 보이는 AppBar 형태로 애니메이션 되는데 이런 효과를 **Sliver효과**라고 한다. SliverAppBar는 Scaffold의 AppBar를 지정하지 않고, body에 CustomScrollView인스턴스를 지정하고, slivers프로퍼티에 SliverAppBar와 SliverFillRemaining위젯을 설정한다. SliverAppBar위젯의 Sliver 효과를 위한 최소한의 프로퍼티는 **pinned(축소시 상단에 AppBar가 고정되는지 설정)**, **expandedHeight(헤더의 최대높이)**, **flexibleSpace(늘어나는 영역의 UI 정의)** 3가지 이다.   
-  flexibleSpace 위젯은 title과 background 프로퍼티를 활용하여 적절히 AppBar 영역이 확장되었을 때의 UI를 작성한다.  
-  SliverFillRemaining 위젯에는 **스크롤 영역에 표시될 화면**을 정의한다. child에 작성한 내용의 크기가 작아도 SliverAppBar 부분이 축소될 때 딱 하나의 크기가 알아서 결정된다.  
- ListView를 사용하여 Sliver 효과를 주고 싶다면 ListView 대신 **SliverList**를 사용한다.  

# 기본 위젯6 / widgets6.dart 파일 참조 / 내비게이션  
- **push**로 새로운 화면을 호출한다.
```dart
    onPressed: () async {
              final person = Person('홍길동',20);
              final result = await Navigator.push(context,MaterialPageRoute(builder: (context)=>SecondClass(person:person)));

              print(result);
            },
```
- 첫 번째 인수로 context가 필요하고, 두 번째 인수로 MaterialPageRoute 인스턴스가 필요하다. MaterialPageRoute 클래스는 안드로이드와 iOS 각 플랫폼에 맞는 화면 전환을 지원해주고, builder 프로퍼티에는 BuildContext 인스턴스를 인수로 받고 이동할 화면의 클래스 인스턴스를 반환하는 함수를 작성한다.  
- push()메서드는 **Future**타입의 반환 타입을 가진다. 미레에 값이 들어올 것을 나타내는 클래스로 **await 키워드**를 메서드 실행 앞에 추가하고, await 키워드를 사용하는 메서드의 인수와 함수 본문 사이에 **async 키워드**를 추가한다. 어떤 일이 끝날 때까지 기다리면서 앱이 멈추지 않도록 하는 방식을 **비동기 방식**이라고 한다.
- **pop**으로 이전 화면으로 이동한다.  
```dart
     onPressed: (){
              Navigator.pop(context,'ok');
            },
```  
Navigator.push() 메서드로 새로운 화면이 표시되어도 이전 화면은 메모리에 남게 된다. 이때 Navigator.pop() 메서드로 현재 화면을 종료하고 이전 화면으로 돌아갈 수 있다. 
- **@required**를 붙이면 필수 입력 인수를 나타낸다.  
- **routes**를 활용하여 내비게이션을 더 효율적으로 구성할 수 있다.  
- push()메서드로 새로운 화면이 실행되고 pop() 메서드로 이전 화면으로 돌아간다. 실행되는 화면은 **스택**구조로 메모리에 쌓이게 된다.  
- **StatefulWidget** 클래스의 내비게이션 동작은 기존에 메모리에 남아 있던 화면도 모두 새로 그리는 동작을 취한다. 그렇기 때문에 StatefulWidget 클래스의 build() 메서드에서는 앱 성능에 지장을 줄만한 코드를 작성하면 안 된다.  
- 위의 문제를 해결하기 위해, initState() 메서드를 사용한다. **initState()**메서드는 위젯이 생성될 때 호출이 되고, **dispose()**메서드는 위젯이 완전히 종료될 때(pop될 때) 호출된다. 계산이나 네트워크 요청 등의 로직은 build() 메서드가 아닌, initState() 메서드에서 수행해야 한다. StatefulWidget 클래스에는 build() 메서드 외에도 특정 타이밍에 실행되는 여러 메서드가 있는데 이러한 메서드들을 **생명주기** 메서드라고 부른다.  

# 복잡한 UI 작성(1) 
  -  내비게이션바, CarouselSlider, ListView를 활용한 UI
  ---------------------------  
  - AppBar의 centertitle 프로퍼티로 앱바의 가운데 글자를 위치할 수가 있다.  
  - 전체 테마를 변경할 때는 MaterialApp 클래스의 theme 프로퍼티를 설정해준다.  
  - AppBar 위젯의 **actions 프로퍼티**를 이용하여 위젯의 리스트를 정의하여 간단히 메뉴를 추가할 수가 있다.  
  - Column의 mainAxisAlignment 프로퍼티를 MainAxisAlignment.spaceEvenly로 해주면 서로 적절한 간격을 둔다.  
  - **Opacity**위젯을 사용하여 투명도를 0.0~1.0 사이로 설정한다. 0.0은 완전히 투명한 상태여서 위젯이 위치해 있지만, 보이지 않게 된다.  
  - **PageView** 위젯을 사용해 **carousel_slider**라이브러리를 사용하여 자동 스크롤 지원 기능을 사용할 수 있다.  
  - CarouselSlider의 options프로퍼티에서 CarouselOptions()를 통해 height와 autoPlay를 조절할 수 있다.  
  - **ClipRRect** 위젯을 통해 child를 둥근 사각형으로 만든다. borderRadius 프로퍼티를 통해 모서리를 얼마나 둥글게 할지 설정하고, child로 Image를 asset 해준다.  
  - ListView를 사용할 때, 스크롤이 가능한 객체 안에 다시 스크롤 객체를 넣는 경우(ListView 위젯 안에 ListView 위젯이 들어간 상황)에는 **shrinkWrap**프로퍼티를 true로 설정해줘야 한다.  
  - 스크롤 안에 스크롤을 넣는 경우로 안쪽 스크롤을 막아서 정상 동작이 되도록 ListView 위젯의 **physics 프로퍼티**에 NeverScrollableScrollPhysics 클래스의 인스턴스를 설정한다. 이것으로 이 리스트는 스크롤 기능이 정지되어 바깥쪽 스크롤이 정상적으로 동작하게 된다.  
      
# 복잡한 UI 작성(2)
   -  TextFormField, Form, Navigator를 활용한 UI
   --------------------------------------------
   - 사용자에게 값을 입력받을 때는 **TextField** 위젯또는 **TextFormField**위젯을 사용한다. **TextEditingController** 클래스의 인스턴스를 통해 TextField 위젯에 작성된 값을 얻을 수 있다.  
   - 화면이 종료될 때는 반드시 위젯 트리에서 컨트롤러를 해제해야 한다.  
   - TextField 위젯에서는 controller 프로퍼티에 컨트롤러 변수를 설정한다. 이렇게 하면 TextEditingcontroller()로 생성된 인스턴스를 이용하여 TextField 인스턴스의 값을 얻거나 변경된 값을 모니터링 할 수 있다.  
   - TextField 위젯의 값이 변경될 때마다 무언가를 수행하고 싶다면 **addListener()** 메서드를 사용한다.  
   - **Form** 과 **TextFormField** 를 사용하여 사용자 입력값을 검증한다.  
   - **TextFormField** 위젯은 TextField 위젯이 제공하는 기능에 추가로 **validator** 프로퍼티를 활용한 검증 기능도 제공한다.  
   - 검증에는 TextFormField 위젯을 사용하며, 검증할 내용 전체를 Form 위젯으로 감싼다. Form 위젯에는 유니크한 키를 지정해야 하며 **GlobalKey<FromState> 인스턴스**를 키로 사용한다.  
   - 폼의 검증으로 **_fromKey.currenState.validate()**로 수행하며 true 또는 false 값을 반환한다.  
   - **trim()** 메서드는 앞뒤 공백을 제거해준다.  
   - TextFormField 위젯의 decoration 프로퍼티를 사용하여 InputDecoration 클래스를 설정하여 외곽선, 힌트 등을 설정한다.  
   - TextField에 입력한 내용은 정수로 입력해도 문자열로 저장이 되기 때문에 문자열을 double 타입으로 전달받으려면 **double.parse()**함수를 사용해야 한다.  
      
# 복잡한 UI 작성(3)  
   - Timer를 이용하여 스탑워치 만들기
   ---------------------------------
   - **BottomAppBar** 위젯은 하단에 배치하는 AppBar이다. Scaffold 위젯의 bottomNavigationBar 프로퍼티에 배치하는 것이 일반적이고, FloatingActionButton 위젯과도 자연스럽게 어울린다. BottomAppBar 위젯 자체로는 아무것도 없는 빈 영역이고, 일반적으로 하단 메뉴와 FloatingActionButton 위젯을 함께 사용하는 경우에 사용된다.  
   - 특정 위치에 위치시키기 위해서는 **Positioned** 위젯을 사용한다.  
   - Timer 클래스는 dart:async 패키지에 포함된 클래스이다.
   ```dart
   Timer.periodic(Duration(milliseconds:10),(timer){ //0.01초에 한 번씩 작업을 수행
   ///할 일})
   ```
   - **map()** 함수는 기존 값을 다른 형태로 변환해준다. map() 함수를 사용하여 Text 위젯으로 감싸고 toList()로 다시 리스트 형태로 변환을 했다.  
   
# 복잡한 어플 구상하기  
   -firebase 사용해보기
   --------------------   
  - 데이터베이스의 주요 기능을 한 단어로 요약하면 **CRUD**이다. 데이터를 추가(create)하고, 읽고(read), 수정하고(update), 삭제(delete)하는 것이다. 원하는 데이터를 가져오는(query)  
  - Firebase는 문서 기반의 구조라서 이해하기 쉽고, 실시간으로 데이터 읽기를 제공하는 특징이 있다. 
  - Friebase는 NoSQL 데이터베이스의 일종으로 자료의 저장 단위는 **문서**이다. 문서에는 **키-값**형태로 다양한 형태의 자료를 저장할 수 있다.  
  - Firestore 문서는 DocumentSnapshot 클래스의 인스턴스이다.  
  - 지속적으로 흘러들어오는 스트림을 통해 UI를 그린다. 여기서 StreamBuilder 클래스를 사용하는데, 스트림과 연결해두면 **스트림의 값이 변할 때마다 builder 부분이 다시 호출된다.** 이때 매번 화면 전체를 다시 그리지 않고 **StreamBuilder로 일부분만 그린다.** Firestore에서는 **snapshots() 메서드**를 사용해 데이터의 스트림을 쉽게 얻을 수 있다.  
  - 데이터를 삭제할 때도 문서 ID가 필요하기 때문에 **DocumentSnapshot**을 인수로 받도록 한다.
</details>
