import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:proxyprovider_demo/model/employee_model.dart";
import "package:proxyprovider_demo/model/login_model.dart";
import "package:proxyprovider_demo/view/mainapp_view.dart";

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers:[
        Provider(
          create:(context){
            return const Login(
              userName:"shubham",
              password:"454");
          }
        ),

        ProxyProvider<Login,Employee>(
          update:(context, login, employee) {
            return Employee(
              userName: login.userName,
              password: login.password,
              empName: "shubham Tate",
              empId: "64"
            );
          },
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner:false,
        home: MainApp(),
      ),
    );
  }
}