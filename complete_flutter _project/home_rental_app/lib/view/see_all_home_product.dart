
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_rental_app/controller/home_controller.dart';
import 'package:provider/provider.dart';

import 'home_details_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SeeAllHomeProduct extends StatelessWidget {
  const SeeAllHomeProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProductListObj = Provider.of<HomeController>(context,listen:false).homeDetailsModelObjList;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
              "Most popular",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body:MasonryGridView.builder(
        
        itemCount: homeProductListObj.length,
        scrollDirection: Axis.vertical,
        
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
         itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                  onTap: (){
                   Provider.of<HomeController>(context,listen: false).onTapPushHomeDetailsObj(homeProductListObj[index]);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return const HomeDetailsScreen();
                    }));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    // margin: const EdgeInsets.only(left: 22),
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
                ),
          );
         }),
    );
  }
}