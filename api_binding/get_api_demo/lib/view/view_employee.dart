


import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class ViewEmployee extends StatefulWidget{

  const ViewEmployee({super.key});

  @override
  State<ViewEmployee> createState()=> _ViewEmployeeState();

}

class _ViewEmployeeState extends State<ViewEmployee>{

List<dynamic> empData = [];

void getEmployeeData()async{

  Uri uri = Uri.parse("https://dummy.restapiexample.com/api/v1/employees");

  http.Response response = await http.get(uri);

  log(response.body);

  var responseData = jsonDecode(response.body);

  setState(() {
    empData = responseData["data"];
  });
}
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Api Demo"),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      body:ListView.builder(
        itemCount:empData.length,
        itemBuilder: (context,index){
          return Row(
            children:[
              Text(empData[index]["employee_name"]),
              const SizedBox(width: 10,),
              Text("${empData[index]["employee_salary"]}"),
            ]
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getEmployeeData();
        },
      ),
    );
  }
}