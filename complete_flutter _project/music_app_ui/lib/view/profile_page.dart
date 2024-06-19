import 'package:flutter/material.dart';
import 'package:music_app_ui/view/listview_image.dart';
import 'package:music_app_ui/view/single_songs.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   
   List singlesongsImagedescriptionList = [
    "Easy Living",
    "Berrechid"
   ];

  List singlesongsImagePathList = [
    "lib/assets/6.jpeg",
    "lib/assets/7.jpeg"
  ];

  List singlesongsTitleList =[
    "We Are Chaos",
    "Smile "
  ];

List titleList =[
  "Dead inside",
  'Alone',
  'Heartless '
];
  List imagePath = [
 'lib/assets/3.jpeg',
 "lib/assets/4.jpeg",
 "lib/assets/5.jpeg",
 
  ];

  
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 143, 23, 23),
      body: Column(
        children: [
          SizedBox(
            height: 367,
            width: 459,
            child: PageView.builder(
              itemCount: 3,
              controller: _controller,
              itemBuilder: (conext, intdex) => Stack(
                children: [
                  Image.asset(
                    "lib/assets/2.jpeg",
                    height: 367,
                    width: 459,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 280,
                    child: Container(
                      height: 155,
                      width: 586,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(24, 24, 24, 0.01),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(24, 24, 24, 1),
                                // color: Colors.white,
                                offset: Offset(-1, 1),
                                blurRadius: 100,
                                blurStyle: BlurStyle.inner),
                            BoxShadow(
                                color: Color.fromRGBO(24, 24, 24, 1),
                                // color: Colors.white,
                                offset: Offset(-1, 1),
                                blurRadius: 100,
                                blurStyle: BlurStyle.outer)
                          ]),
                    ),
                  ),
                  const Positioned(
                    top: 225,
                    left: 20,
                    child: Text(
                      "A.L.O.N.E",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 36,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Positioned(
                    top: 280,
                    left: 22,
                    child: SizedBox(
                      height: 37,
                      width: 127,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromRGBO(255, 46, 0, 1))),
                        onPressed: () {},
                        child: const Text(
                          "Subscribe",
                          style: TextStyle(
                            color: Color.fromARGB(255, 19, 19, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15,),
      
      
          SmoothPageIndicator(
              axisDirection: Axis.horizontal,
              effect: const ExpandingDotsEffect(
                  dotHeight: 7,
                  dotWidth: 7,
                  activeDotColor: Color.fromRGBO(255, 61, 0, 1)),
              controller: _controller,
              count: 3),
      
              const Padding(
                padding:  EdgeInsets.only(left: 20,right: 10),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text("Discography",
                    style: TextStyle(
                
                     color: Color.fromRGBO(255,46,0,1),
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),),
                    Text("See all",
                     style: TextStyle(
                
                     color: Color.fromRGBO(248,162,69,1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                    ),)
                
                  ],
                ),
              ),
      
              const SizedBox(height: 10,),
      
              Container(
                height: 180,
                width: double.infinity,
                
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagePath.length,
                  itemBuilder:(context,index)=> GestureDetector(
                    onTap:(){ 


                    }, 
                    child: listViewImage(imagePath:imagePath[index],title:titleList[index],date: 2020,)),),
              ),
      
                const SizedBox(height: 5,),
                const Padding(
                padding:  EdgeInsets.only(left: 20,right: 10),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text("Popular singles",
                    style: TextStyle(
                
                      color: Color.fromRGBO(203,200,200,1),
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    ),),
                    Text("See all",
                     style: TextStyle(
                
                     color: Color.fromRGBO(248,162,69,1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                    ),)
                
                  ],
                ),
              ),
      
            Expanded(
              child: ListView.builder(
                    
                itemCount: singlesongsImagePathList.length,
                itemBuilder: (context,index){
                return SingleSongs(
                  imagePath: singlesongsImagePathList[index],
                  title: singlesongsTitleList[index],
                  date: "2023",
                  descrption: singlesongsImagedescriptionList[index],
                );
              }),
            )
              
      
        ],
      ),
    );  }
}
