import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:proxyprovider_demo/model/employee_model.dart";
import "package:proxyprovider_demo/model/login_model.dart";

class MainApp extends StatefulWidget{

const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
@override
Widget build(BuildContext context){
  return Scaffold(
    appBar:AppBar(
      title:const Text("Proxy Provider"),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
    body:Center(
      child:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children:[

          Text(Provider.of<Login>(context).userName!),
          const SizedBox(height:10),
          Text(Provider.of<Login>(context).password!),
          const SizedBox(height:10),
          Text(Provider.of<Employee>(context).empName!),
          const SizedBox(height:10),
          Text(Provider.of<Employee>(context).empId!)
        ]
      ),
    ),
  );
}
}