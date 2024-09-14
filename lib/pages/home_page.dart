import 'package:todo_app/todo/todo_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoList = [
    ['Learn Flutter', false],
    ['Watch Rells', false],
  ];
  @override
  Widget build(BuildContext context) {
    void checkBoxChanged(int index) {
      setState(() {
        todoList[index][1] = !todoList[index][1];
      });
    }

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade400,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('H E Y T O D O'),
        backgroundColor: Colors.deepPurple.shade700,
        foregroundColor: CupertinoColors.white,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => checkBoxChanged(index),
          );
        },
      ),
    );
  }
}
