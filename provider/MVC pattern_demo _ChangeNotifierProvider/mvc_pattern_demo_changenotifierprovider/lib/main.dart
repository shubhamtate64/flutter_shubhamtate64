
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:mvc_pattern_demo_changenotifierprovider/controller/product_controller.dart";
import "package:mvc_pattern_demo_changenotifierprovider/view/get_product_details.dart";

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create:(context){
        return ProductController();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor:Colors.deepPurple),
          useMaterial3: true,
        ),
        home: GetProductDetails(),
      ),
    );
  }
}