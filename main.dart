import 'package:flutter/material.dart';

void main() {
  runApp(MainApp1());
}

class MainApp1 extends StatefulWidget {
  @override
  State<MainApp1> createState() => _MainApp1State();
}

class _MainApp1State extends State<MainApp1> {
  String content = "No Text Data";
  List<String> taskList = [];
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo App"),
          backgroundColor: Colors.blueGrey,
          centerTitle: false,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    // margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(20),

                    child: TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter a task"),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      taskList.add(textEditingController.text);
                      textEditingController.clear();
                    });
                  },
                  height: 50,
                  child: Text("Add Task"),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ],
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(taskList[index]),
                            padding: EdgeInsets.all(10),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              taskList.removeAt(index);
                            });
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

//These takes infinity value :
//row --> tet field -->expanded
//col -> listview -->flexible