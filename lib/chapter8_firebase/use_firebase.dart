import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Todo{
  bool isDone = false;
  String title;
  Todo(this.title, {this.isDone=false}); //isDone 프로퍼티를 옵셔널 프로퍼티로 고치고 기본값을 false로 지정
}


class use_firebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {


  var _todoController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _todoController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('남은 할 일'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _todoController,
                  )
                ),
                RaisedButton(
                  child: Text('할 일 수정하기'),
                  onPressed: ()=>changeTodo(Todo(_todoController.text)),
                ),

              ],
            ),
            StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('todo').snapshots(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return CircularProgressIndicator(); //로딩중 화면 띄우기
                }
                final documents = snapshot.data.documents;
                return Expanded(
                    child: ListView(
                      children: documents.map((doc)=>_buildItemWidget(doc)).toList(),
                    ),);
              }
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemWidget(DocumentSnapshot doc){
    final todo = Todo(doc['title'], isDone: doc['isDone']);
    return ListTile(
      onTap: ()=>_toggleTodo(doc),
      title:Text(
        todo.title,style: todo.isDone
          ? TextStyle(decoration: TextDecoration.lineThrough, fontStyle: FontStyle.italic):
            null
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: ()=>_deleteTodo(doc),
      ),
    );
  }

  void addTodo(Todo todo){
    Firestore.instance
        .collection('todo')
        .add({'title':todo.title, 'isDone' : todo.isDone});
    _todoController.text='';
  }
  void _deleteTodo(DocumentSnapshot doc){
    Firestore.instance.collection('todo').document(doc.documentID).delete();
  }
  void _toggleTodo(DocumentSnapshot doc) {
    Firestore.instance.collection('todo').document(doc.documentID).updateData(
        {'isDone': !doc['isDone']});
  }

  changeTodo(Todo todo) {}
}
