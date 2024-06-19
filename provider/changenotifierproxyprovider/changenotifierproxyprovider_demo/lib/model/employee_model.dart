 import "package:flutter/foundation.dart";

class Employee with ChangeNotifier{

  String? empName;
  String? empId;
  String? userName;
  String? password;

  Employee({required this.empName,required this.empId,required this.userName,required this.password});

 

}