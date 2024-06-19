
import "package:changenotifierproxyprovider_demo/model/employee_model.dart";
import "package:changenotifierproxyprovider_demo/model/login_model.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class MainApp extends StatefulWidget{

  const MainApp({super.key});

  @override
  State<MainApp> createState()=> _MainAppstate();

}

class _MainAppstate extends State<MainApp>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text("ChangeNotifierProxyProvider Demo"),
        centerTitle:true,
        backgroundColor:Colors.blue,
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
            Text(Provider.of<Employee>(context).empId!),
            const SizedBox(height:10),
            Text(Provider.of<Employee>(context).userName!),
            const SizedBox(height:10),
            Text(Provider.of<Employee>(context).password!),
            const SizedBox(height:20),

            ElevatedButton(
              onPressed:(){
                Provider.of<Login>(context,listen: false).changeData(userName: "bhau",password: "33");
              },
              child:const Text("Change userName or Password")
            ),
          ]
        ),
      ),
    );
  }
}