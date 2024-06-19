import "dart:developer";

import "package:flutter/material.dart";

void main(){
  runApp(const MyApp());
  }

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp>  createState() => _MyAppState();
}


class _MyAppState extends State<MyApp>{

  String companyName = "Google";
  int empCount = 250;

@override
Widget build(BuildContext context){
  return Company(
    companyName: companyName,
    empCount: empCount,
    child: MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar:AppBar(
          title: const Text("inherited Company State"),
          centerTitle:true,
          backgroundColor: Colors.red,
        ),
        body:Column(
          children: [
            const CompanyData(),
            const SizedBox(height: 60,),
            GestureDetector(
              onTap:(){
                setState(() {
                  companyName = companyName;
                  empCount = empCount;
                });
              },
              child: const Text("Change Company"),
            ),
          ],
        )

      )),
  );
}

}

class Company extends InheritedWidget{

  final String companyName;
  final int empCount;

const Company({required this.companyName, required this.empCount, super.key, required super.child});

  static Company of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Company>()!;
  }
  
  @override
  bool updateShouldNotify(Company oldWidget) {
    log("updateShouldNotifier");
     return companyName != oldWidget.companyName  || empCount != oldWidget.empCount;
  }
}

class CompanyData extends StatelessWidget{

  const CompanyData({super.key});

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Text(Company.of(context).companyName),
        const SizedBox(width: 20,),
        Text("${Company.of(context).empCount}")
      ],
    );

  }
 }
