import "package:flutter/material.dart";
import "package:provider/provider.dart";

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget{
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers:[
        Provider(
          create:(context){
            return const Employee(
              empName:"kanha",
              empCount:20
            );
          }
        ),

        ChangeNotifierProvider(
          create:(context){
            return  Project(
              projectName: "demo",
              devType: "Application dev"
            );
          }
        ),
      ],
      child:const MaterialApp(
        debugShowCheckedModeBanner:false,
        home: MainApp(),
      ),
    );
  }
}

class Employee{
  final String empName;
  final int empCount;

  const Employee({required this.empName,required this.empCount});

}

class Project with ChangeNotifier{

   String projectName;
   String devType;

   Project({required this.projectName,required this.devType});

   void changeProject(String projectName ,String devType){

    this.projectName = projectName;
    this.devType = devType;
    notifyListeners();
   }
}

class MainApp extends StatefulWidget{

  const MainApp({super.key});

  @override
  State<MainApp> createState()=> _MainAppState();
}

class _MainAppState extends State<MainApp>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text("MultiProvider State MGT Demo"),
        centerTitle:true,
        backgroundColor:Colors.blue[300],
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
           Text(Provider.of<Employee>(context).empName),
           const SizedBox(height:10),
           Text("${Provider.of<Employee>(context).empCount}"),
           const SizedBox(height:22),
           Text(Provider.of<Project>(context).projectName),
           const SizedBox(height:10),
           Text(Provider.of<Project>(context).devType),
           const SizedBox(height:30),
           ElevatedButton(
            onPressed:(){
               Provider.of<Project>(context,listen: false).changeProject("mult", "dev");
            },
            child:const Text("Chang Projects"),
           ),
        ]
      ),
    );
  }
}

