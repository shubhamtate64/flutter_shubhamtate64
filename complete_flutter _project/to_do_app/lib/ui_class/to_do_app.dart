import 'package:flutter/material.dart';

import '../model_class/todo_model_class.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State createState() => _ToDoAppState();
}

class _ToDoAppState extends State {
  Color? _backgroundColor;

  TextEditingController dateController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<ToDoModelClass> todoList = [
    ToDoModelClass(
      title: "Take notes",
      description: "Take notes of every app you write",
      date: "10 July 2023",
    ),
    ToDoModelClass(
        title: "Arrange Meeting",
        description: "Meet the backend team",
        date: "10 July 2023"),
  ];

  List listOfColors = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1),
  ];

  void submit(bool todoedit, ToDoModelClass? todoModelObj) {
    if (titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        dateController.text.trim().isNotEmpty) {
      if (todoedit) {
        todoModelObj!.title = titleController.text.trim();
        todoModelObj.description = descriptionController.text.trim();
        todoModelObj.date = dateController.text.trim();
      } else {
        todoList.add(
          ToDoModelClass(
              title: titleController.text.trim(),
              description: descriptionController.text.trim(),
              date: dateController.text.trim()),
        );
      }
    }

    cleanController();
    Navigator.of(context).pop();
    setState(() {});
  }

  void onSubmit() {
    
  }

  void showBottomSheet([bool todoedit = false, ToDoModelClass? todoModelObj]) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const SizedBox(height: 10),
              const Text("Create Task",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  )),
              const SizedBox(height: 12),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Title",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 139, 148, 11),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextField(
                      controller: titleController,
                      onEditingComplete: onSubmit,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.yellow,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 57, 176, 39),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Description",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 139, 148, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    TextField(
                      controller: descriptionController,
                      onEditingComplete: onSubmit,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.purple),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Date",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 139, 148, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                    TextField(
                      controller: dateController,
                      onEditingComplete: onSubmit,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(),
                        ),
                      ),
                    ),
                  ]),
              const SizedBox(height: 10),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: _backgroundColor),
                  onPressed: () {
                    //onSubmit();
                    if (_backgroundColor != null) {
                      submit(todoedit, todoModelObj);
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ]),
          );
        });

        
  }

  void editTask(ToDoModelClass todoModelObj) {
    titleController.text = todoModelObj.title;
    descriptionController.text = todoModelObj.description;
    dateController.text = todoModelObj.date;

    showBottomSheet(true, todoModelObj);
  }

  void removeTask(ToDoModelClass todoModelObj) {
    todoList.remove(todoModelObj);
    setState(() {});
  }

  void cleanController() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TO-DO-APP",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
              color: Color.fromRGBO(2, 167, 177, 1)),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 16,
              ),
              child: Container(
                  // height: 300,
                  // width: 300,
                  decoration: BoxDecoration(
                    color: listOfColors[index % listOfColors.length],
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 10),
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          blurRadius: 10),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        //crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          //1
                          Row(children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    todoList[index].title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    todoList[index].description,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25,
                                      color: Color.fromRGBO(84, 84, 84, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),

                          //2
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: [
                                Text(
                                  todoList[index].date,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color.fromRGBO(132, 132, 132, 1),
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    //Edit Task
                                    GestureDetector(
                                      onTap: () {
                                        editTask(todoList[index]);
                                      },
                                      child: const Icon(
                                        Icons.edit_outlined,
                                        color: Color.fromRGBO(0, 139, 148, 1),
                                      ),
                                    ),

                                    const SizedBox(
                                      width: 10,
                                    ),

                                    //Remove Task
                                    GestureDetector(
                                      onTap: () {
                                        removeTask(todoList[index]);
                                      },
                                      child: const Icon(Icons.delete_outline,
                                          color:
                                              Color.fromRGBO(0, 139, 148, 1)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet();
        },
        tooltip: "Add New",
        child: const Icon(Icons.add),
      ),
    );
  }
}
