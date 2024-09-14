import 'package:todo_app/todo/todo_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List todoList = [];

  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
    });
  }

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
      _controller.clear();
    });
  }

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
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.notes_outlined),
                  hintText: 'Add a new ToDo Task',
                  filled: true,
                  fillColor: Colors.white24,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: CupertinoColors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            )),
            FloatingActionButton(
              onPressed: saveNewTask,
              child: const Icon(CupertinoIcons.add),
            ),
          ],
        ),
      ),
    );
  }
}
