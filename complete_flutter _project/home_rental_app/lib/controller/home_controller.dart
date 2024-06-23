


import 'package:flutter/material.dart';
import 'package:home_rental_app/model/home_details_model.dart';


class HomeController with ChangeNotifier{

 HomeController();

  List<HomeDetailsModel> homeDetailsModelObjList =[];
 HomeDetailsModel? homeDetailsObj;

  void onTapPushHomeDetailsObj(HomeDetailsModel? obj){
   homeDetailsObj = obj;
    notifyListeners();
    
  }

  
}