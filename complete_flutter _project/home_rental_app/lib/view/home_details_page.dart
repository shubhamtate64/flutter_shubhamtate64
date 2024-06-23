import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:home_rental_app/controller/home_controller.dart";
import "package:provider/provider.dart";

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeDetailsObj =
        Provider.of<HomeController>(context, listen: false).homeDetailsObj;
    return Scaffold(
     
      bottomNavigationBar: Container(
        height: 113,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(255, 255, 255, 1),
                // color: Colors.black,
                blurRadius: 10,
                spreadRadius: 30),
          ],
        ),
        child: Center(
          child: Container(
            height: 55,
            width: 220,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(32, 169, 247, 1),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Center(
              child: Text(
                "Rent Now",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: 64,
              left: 161,
              child: Text(
                "Details",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Positioned(
                top: 64,
                left: 22,
                child: GestureDetector(
                  onTap: () {
                    Provider.of<HomeController>(context, listen: false)
                        .homeDetailsObj = null;
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_left,
                    size: 30,
                  ),
                )),
            Positioned(
              top: 132,
              left: 22,
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(40),
                child: Image.asset(homeDetailsObj!.imagepath,
                    height: 244, width: 346, fit: BoxFit.fill),
              ),
            ),
            Positioned(
              top: 146,
              left: 36,
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(112, 200, 250, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
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
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 399,
              left: 25,
              child: Text(
                homeDetailsObj.title,
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
              top: 435,
              left: 25,
              child: Text(
                homeDetailsObj.location,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(72, 72, 72, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 420,
              left: 251,
              child: SizedBox(
                width: 115,
                height: 24,
                child: Row(
                  children: [
                    Text(
                      "\$${homeDetailsObj.rentprice}",
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
              ),
            ),
            Positioned(
              top: 476,
              left: 9,
              child: SizedBox(
                height: 141,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 141,
                        width: 112,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.bed,
                                size: 30, color: Color.fromRGBO(90, 90, 90, 1)),
                            Text(
                              "Bedrooms",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color.fromRGBO(90, 90, 90, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Text(
                              "5",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 141,
                        width: 112,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.bathtub_rounded,
                                size: 30, color: Color.fromRGBO(90, 90, 90, 1)),
                            Text(
                              "Bathroom",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color.fromRGBO(90, 90, 90, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Text(
                              "6",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 141,
                        width: 112,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.square_foot_rounded,
                                size: 30, color: Color.fromRGBO(90, 90, 90, 1)),
                            Text(
                              "Square ft",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color.fromRGBO(90, 90, 90, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Text(
                              "7,000 sq ft",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 635,
              left: 22,
              child: SizedBox(
                height: 225,
                width: 346,
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, intdex) {
                      return Text(
                        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
