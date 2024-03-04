import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/model/todo.dart';
import '../widgets/item.dart';

class Home extends StatefulWidget {
 Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo =[];
  final _addcontroller = TextEditingController();
  
  @override
  void initState(){
    _foundToDo = todosList;
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24, 
              vertical: 15),
            child: Column(
              children: [
               searchBox(),
               Expanded(
                 child: ListView(
                  children:[
                    Container(
                      margin:EdgeInsets.only(top:50,bottom:20),
                       child: Text('all to do list',
                       style: TextStyle(
                        fontSize: 30,
                        color: Colors.amber[900],
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
          
                    for( ToDo todo in _foundToDo)
                    ToDoList(
                      todo: todo,
                      changetodo: _changetodo,
                      deleteitem: _deleteitem,
                    ),
          
                  ],
                 ),
               ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children:[
              Expanded(child: Container(
                margin: EdgeInsets.only(
                bottom: 20, 
                right: 20,
                left: 20,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [BoxShadow(color: Colors.grey,
                  offset: Offset(0.0,0.0,),
                  blurRadius: 10.0,
                  spreadRadius:0.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _addcontroller,
                  decoration: InputDecoration(
                    hintText: 'add list',
                    border: InputBorder.none,
                  )
                )
               ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton( 
                  child: Text('+',style: TextStyle(fontSize: 40),),
                 onPressed: () {
                     _addtodoItem(_addcontroller.text);   
                    },

                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(60, 60),
                    // primary: Colors.amber[900],
                    elevation: 10,
                  ),
                ),
              ),
            ],
            ),
          ),
        ],
      ),
    );
  }

  void _changetodo(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteitem(String id){
    setState(() {
    todosList.removeWhere((item) => item.id==id);
    });
  }

  void _addtodoItem(String todo){
    setState(() {
    todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: todo));
    });
    _addcontroller.clear();
  }

  void _finditem(String enteredKeyword){
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
        results = todosList;
        } else {
    results = todosList.where((item) => item.todoText!
    .toLowerCase()
    .contains(enteredKeyword.toLowerCase()))
    .toList();
    }

    setState(() {
      _foundToDo = results;
    });

  }


  Widget searchBox(){
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
     child: TextField(
      onChanged: (value)=>_finditem(value),
           decoration: InputDecoration(
           contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(
                    Icons.search,
                    color: Colors.amber,
                    size:20,
                  ),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 20,
                    minWidth: 25,
                  ),
                  border: InputBorder.none,
                  hintText: 'Search my Notes',
                  hintStyle: TextStyle(color: Colors.amber[900]),
                ),
              ),
            );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.amber[50],
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          Icon(
            Icons.menu,
            color: Colors.amber[900],
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('images/1.png'),
            ),
          )
        ],
      ),
    );
  }
}
