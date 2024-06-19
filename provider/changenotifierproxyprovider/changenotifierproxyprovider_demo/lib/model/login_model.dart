
import 'package:flutter/foundation.dart';

class Login with ChangeNotifier{

   String? userName;
   String? password;

  Login({required this.userName,required this.password});
  void changeData({String? userName,String? password}){
  this.userName = userName;
  this.password = password;
  notifyListeners();
 }
}