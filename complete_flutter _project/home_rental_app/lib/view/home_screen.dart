import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_rental_app/controller/home_controller.dart';

import 'package:home_rental_app/view/home_details_page.dart';
import 'package:home_rental_app/view/see_all_home_product.dart';
import 'package:provider/provider.dart';

import 'my_search_delegate.dart';

class HomeScreen extends StatelessWidget {
 const  HomeScreen({super.key});

 

  @override
  Widget build(BuildContext context) {
     var homeProductListObj = Provider.of<HomeController>(context,listen: false).homeDetailsModelObjList;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Positioned(
            top: 70,
            left: 22,
            child: Text(
              "Hey Dravid,",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(101, 101, 101, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Positioned(
            top: 56,
            left: 320,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(48),
              child: Image.asset(
                "lib/assets/homerental2_profile.png",
                height: 48,
                width: 48,
              ),
            ),
          ),
          Positioned(
            top: 113,
            left: 22,
            child: SizedBox(
              height: 60,
              width: 188,
              child: Text(
                "Let’s find your best residence ,",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 195,
            left: 22,
            child: GestureDetector(
              onTap: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 46,
                width: 346,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Row(
                  children: [
                    const Icon(Icons.search_outlined),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Search your favourite paradise",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Color.fromRGBO(33, 33, 33, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                
              ),
            ),
          ),
          Positioned(
            top: 263,
            left: 22,
            child: Text(
              "Most popular",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Positioned(
            top: 267,
            left: 314,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return const  SeeAllHomeProduct() ;
                }));
              },
              child: Text(
                "See All",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(32, 169, 247, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 310,
            child: SizedBox(
              height: 306,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeProductListObj.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                     Provider.of<HomeController>(context,listen: false).onTapPushHomeDetailsObj(homeProductListObj[index]);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return const HomeDetailsScreen();
                      }));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(left: 22),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                   homeProductListObj[index].imagepath,
                                    height: 196,
                                    width: 189,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(112, 200, 250, 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  height: 21.75,
                                  width: 45,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.star_outlined,
                                        size: 15.94,
                                        color: Color.fromRGBO(251, 227, 12, 1),
                                      ),
                                      Text(
                                        "4.9",
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            homeProductListObj[index].title,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            homeProductListObj[index].location,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color.fromRGBO(81, 81, 81, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "\$${homeProductListObj[index].rentprice}",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Color.fromRGBO(32, 169, 247, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Text(
                                "/Month",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Color.fromRGBO(81, 81, 81, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 635,
            left: 22,
            child: Text(
              "Nearby your location",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Positioned(
            top: 639,
            left: 327,
            child: Text(
              "More",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(32, 169, 247, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            top: 684,
            left: 22,
            child: Container(
              height: 108,
              width: 346,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      homeProductListObj[2].imagepath,
                      height: 90,
                      width: 90,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        homeProductListObj[2].title,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            size: 14,
                            color: Color.fromRGBO(90, 90, 90, 1),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                           homeProductListObj[2].location,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color.fromRGBO(90, 90, 90, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.bed,
                              size: 15, color: Color.fromRGBO(90, 90, 90, 1)),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "4 Bedrooms",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color.fromRGBO(90, 90, 90, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Icon(Icons.bathtub_rounded,
                              size: 15, color: Color.fromRGBO(90, 90, 90, 1)),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "5 Bathrooms",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color.fromRGBO(90, 90, 90, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 130,
                          ),
                          Text(
                            "\$${homeProductListObj[2].rentprice}",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color.fromRGBO(32, 169, 247, 1),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            "/Month",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color.fromRGBO(81, 81, 81, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
