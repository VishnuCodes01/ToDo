import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List todoList = [
      ['Learn Flutter', true],
      ['Watch Rells', false],
    ];
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('VTodo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: CupertinoColors.white,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, index) {
          return Container(
            child: Text(
              todoList[index][0],
            ),
          );
        },
      ),
    );
  }
}
