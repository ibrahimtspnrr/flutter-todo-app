import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/colors.dart';
import 'package:flutter_todo_app/model/todo.dart';

class ToDoItem extends StatelessWidget{
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem ({Key? key , required this.todo,required this.onToDoChanged,required this.onDeleteItem,}) : super (key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child:ListTile(
        onTap: () {
          //print("print");
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        contentPadding:EdgeInsets.symmetric(horizontal: 20, vertical: 5) ,
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone? Icons.check_box:Icons.check_box_outline_blank ,
          color: tdBlue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration:todo.isDone? TextDecoration.lineThrough:null,
          ),
        ),
        trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Color(0xFF571D1D), //rengi değiştiricem
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              color: Colors.white,
              iconSize: 18,
              icon: Icon(Icons.delete),
              onPressed: () {
                //print("done");
                onDeleteItem(todo.id);
              },
            )
        ),
      ),
    );
  }

}