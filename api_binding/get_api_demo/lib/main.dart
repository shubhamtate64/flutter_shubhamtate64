
import "package:flutter/material.dart";
import "package:get_api_demo/view/view_employee.dart";

void main()=> runApp(const MyApp());

class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ViewEmployee(),
    );
  }
}