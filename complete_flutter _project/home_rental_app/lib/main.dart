import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_rental_app/controller/home_controller.dart';
import 'package:home_rental_app/view/getstartedpage.dart';
import "package:provider/provider.dart";

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,);
 

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
          create:(context){
            return HomeController();
          },
          child:  MaterialApp(home: GetStartedPage()),
        
    );
  }
}
