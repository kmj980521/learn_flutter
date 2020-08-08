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
