import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_rental_app/controller/home_controller.dart';
import 'package:home_rental_app/model/home_details_model.dart';
import 'package:home_rental_app/view/home_screen.dart';
import 'package:provider/provider.dart';

class GetStartedPage extends StatelessWidget {
  GetStartedPage({super.key});

  final List<Map<String, dynamic>?> allHomeProductList = [
    {
      "imagepath": "lib/assets/homerental3.jpeg.jpeg",
      "title": "Night Hill Villa",
      "location": "London,Night Hill",
      "rentprice": "5900",
    },
    {
      "imagepath": "lib/assets/homerental4.jpeg",
      "title": "Night Villa",
      "location": "London,New Park",
      "rentprice": "4900",
    },
    {
      "imagepath": "lib/assets/homerental5.jpeg",
      "title": "Jumeriah Golf Estates Villa",
      "location": "London,Area Plam Jumeriah",
      "rentprice": "4500"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Image.asset(
              "lib/assets/homerental1.jpeg",
              height: 631,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Lets find your Paradise",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Find your perfect dream space",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Color.fromRGBO(101, 101, 101, 1),
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
          Text(
            "with just a few clicks",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Color.fromRGBO(101, 101, 101, 1),
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 55,
            width: 220,
            child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(32, 169, 247, 1))),
              onPressed: () {
               var  homeDetailsModelObjList = Provider.of<HomeController>(context,listen: false).homeDetailsModelObjList;

                 for (var homeProductListObj in allHomeProductList) {
                  var homeProductObj = HomeDetailsModel(
                    imagepath: homeProductListObj!["imagepath"],
                    title: homeProductListObj["title"],
                    location: homeProductListObj["location"],
                    rentprice: homeProductListObj["rentprice"],
                  );
                homeDetailsModelObjList.add(homeProductObj);
                 }
                 
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
                  return const HomeScreen();
                }));           
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return HomeScreen();
                // }));
              },
              child: Text(
                "Get Started",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
