
import "package:changenotifierproxyprovider_demo/model/employee_model.dart";
import "package:changenotifierproxyprovider_demo/model/login_model.dart";
import "package:changenotifierproxyprovider_demo/view/mainapp_view.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

void main()=> runApp(const MyApp());

class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(
          create:(context){
            return Login(
              userName:"shubham",
              password:"1020"
            );
          }
        ),

        ChangeNotifierProxyProvider(
          create:(context) {
            return Employee(
              empName:"shubham Tate",
              empId:"64",
              userName:Provider.of<Login>(context,listen:false).userName,
              password:Provider.of<Login>(context,listen:false).password,
            );
          },
          update:(context, login, employee) {
            return Employee(
              empName: employee!.empName,
              empId:employee.empId,
              userName: Provider.of<Login>(context).userName,
              password: Provider.of<Login>(context).password,
            );
            
          },
          
        ),
      ],
      child:const MaterialApp(
        debugShowCheckedModeBanner:false,
        home:MainApp(),
      )
    );
  }
}
