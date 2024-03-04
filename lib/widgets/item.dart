import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../model/todo.dart';


class ToDoList extends StatelessWidget{
  final ToDo todo;
  final changetodo;
  final deleteitem;

  const ToDoList({Key? key, required this.todo, required this.changetodo, required this.deleteitem}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      margin:EdgeInsets.only(bottom: 20),
      child:ListTile(
        onTap: (){
          // print('clicked to do');
          changetodo(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor:Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.amber[900],
        ),
        title:Text(
          todo.todoText!,
        style: TextStyle(
          fontSize: 16,
          color:Colors.amber[900],
          decoration: todo.isDone? TextDecoration.lineThrough : null,
         ),
        ),
        trailing: Container(
          padding:EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical:12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              deleteitem(todo.id);
            },
          )
        )
      ),
    );
  }

}