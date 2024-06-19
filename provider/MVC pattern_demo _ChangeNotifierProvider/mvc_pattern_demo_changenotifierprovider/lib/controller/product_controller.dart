


import "package:flutter/material.dart";
import "package:mvc_pattern_demo_changenotifierprovider/model/product_model.dart";


class ProductController with ChangeNotifier {

  ProductModel? productModelObj;

  void addProductData({ProductModel? pObj}){

    productModelObj = pObj;

  }

  void addToFavorite(){

      productModelObj!.isFavorite =  (!productModelObj!.isFavorite!);
    
    // if(productModelObj!.isFavorite!){
    //   productModelObj!.isFavorite = false;
    // }else{ 
    //   productModelObj!.isFavorite = true;
    // }
    notifyListeners();
  }

  void addQuantity(){
    productModelObj!.quantity = productModelObj!.quantity! + 1;
    notifyListeners();
  }

  void removeQuantity(){
    productModelObj!.quantity = productModelObj!.quantity! - 1;
    notifyListeners();
  }
}