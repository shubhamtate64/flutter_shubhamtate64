
import "dart:convert";
import "dart:developer";

import "package:flutter/material.dart";

import "package:get_api_with_model_class/model/employee_model.dart";
import "package:http/http.dart" as http;

class ViewEmployee extends StatefulWidget {
  const ViewEmployee({super.key});

  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}

class _ViewEmployeeState extends State<ViewEmployee> {

  List<Data> empdata =[];

  void getEmpData()async{

    Uri uri = Uri.parse("https://dummy.restapiexample.com/api/v1/employees");

    http.Response response = await http.get(uri);

    log(response.body);

    var responseData = jsonDecode(response.body);

    Employee obj = Employee(responseData);

    setState(() {
      empdata = obj.data!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Api With Model Class"),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      body: ListView.builder(
        itemCount: empdata.length,
        itemBuilder: (BuildContext context,int index){
          return  Row(
            children: [
              Text(empdata[index].employee_name!),
              const SizedBox(width: 10,),
              Text(empdata[index].employee_salary!)
            ],
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:getEmpData
      ),
    );
  }
}