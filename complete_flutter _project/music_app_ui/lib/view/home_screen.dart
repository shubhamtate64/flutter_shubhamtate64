
import 'package:flutter/material.dart';

import 'package:music_app_ui/view/gallery.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 1),
            boxShadow: [
              BoxShadow(
                
              )
            ]
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Image.asset(
                  "lib/assets/1.jpeg",
                  fit: BoxFit.cover,
                  
                  height: 600,
                  width: 497,
                  alignment: Alignment.topCenter
                ),

                

                 const Positioned(
                  top: 400,
                  left: 44,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                        Text(
                         "Dancing between ",
                         style: TextStyle(
                             color: Color.fromRGBO(255, 255, 255, 1),
                             fontSize: 33,
                             
                             fontWeight: FontWeight.w500,
                             fontStyle: FontStyle.normal),
                       ),
                       Text("The shadows",style: TextStyle(
                             color: Color.fromRGBO(255, 255, 255, 1),
                             fontSize: 33,
                             
                             fontWeight: FontWeight.w500,
                             fontStyle: FontStyle.normal),
                       ),
                       Text("Of rhythm",
                       style:TextStyle(
                             color: Color.fromRGBO(255, 255, 255, 1),
                             fontSize: 33,
                             
                             fontWeight: FontWeight.w500,
                             fontStyle: FontStyle.normal),
                       ),

                        // SizedBox(height: 50,),
                       
                     ],
                   ),
                 ),
                 
                 
                 
                 
                   GestureDetector(
                     onTap:(){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return  Gallery();
                       }));
                     },
                     child: Center(
                     child: Container(height: 47,
                     width: 261,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(19),
                       color:const Color.fromRGBO(255,46,0,1), 
                     ),
                       child: const Center(
                         child:  Text("Get started",
                                                 style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(19,19,19,1)
                                                 )),
                       )),
                                  ),
                   ),
                 
            
               
              ],
            ),
                      
                      
            const SizedBox(height: 15,),
                      
                      
            Center(
                       child: Container(height: 47,
                      width: 261,
                       decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                         border: Border.all(
                          color: const Color.fromRGBO(255,46,0,1)
                        ),
                        //  borderRadius: BorderRadius.horizontal(left: Radius.circular(20),right: Radius.circular(20))
                         // color:const Color.fromRGBO(255,46,0,1),
                         borderRadius: BorderRadiusDirectional.circular(19) 
                       ),
                        child: const Center(
                          child:  Text("Continue with Email",
                                                  style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:  Color.fromRGBO(255,46,0,1),
                          )),
                        )),
                                    ),
                    
                    const SizedBox(height:20),
                     const Center(
                      child: Opacity(
                        opacity: 0.43,
                        child:Text("by continuing you agree to terms",
                        style: TextStyle(
                          color: Color.fromRGBO(203,200,200,3),
                          fontSize: 14
                        ),),
                      ),
                    ),
                    const Center(
                      child: Opacity(
                        opacity: 0.43,
                        child:Text("of services and  Privacy policy",
                        style: TextStyle(
                          color: Color.fromRGBO(203,200,200,3),
                          fontSize: 14
                        ),),
                      ),
                    )
                      
            
            //  Center(
            //       child: Container(height: 47,
            //       width: 261,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(19),
            //         // color:const Color.fromRGBO(255,46,0,1), 
            //       ),
            //         child: ElevatedButton(onPressed: (){},
            //         style:const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(255,46,0,1))),
            //          child: const Text("Get start",
            //         style:TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.w600,
            //           color: Color.fromRGBO(19,19,19,1)
            //         )))),
            //     ),
                //  Stack(
                //   alignment: Alignment.topCenter,
                //    children: [
                //     Container(
                //       height:235,
                //       width: 497,
                     
                //       decoration: const BoxDecoration(
                //          color:Color.fromRGBO(19,19,19,1),
                //         boxShadow:[
                //           BoxShadow(offset: Offset(1, -1)
                //           ,color:Color.fromRGBO(19,19,19,1),
                //           blurRadius: 1,
                //            )
                //         ]),
                //       child: Center(
                //       child: Container(height: 47,
                //       width: 261,
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //           color: const Color.fromRGBO(255,46,0,1)
                //         ),
                //         //  borderRadius: BorderRadius.horizontal(left: Radius.circular(20),right: Radius.circular(20))
                //         // color:const Color.fromRGBO(255,46,0,1),
                //         borderRadius: BorderRadiusDirectional.circular(20) 
                //       ),
                //         child: ElevatedButton(onPressed: (){},
                //         style:const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(19,19,19,1))),
                //          child: const Text("Continue with Email",
                //         style:TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.w600,
                //           color:  Color.fromRGBO(255,46,0,1),
                //         )))),
                //                    ),
                //     ),
                //    ],
                //  )
                  ],
                ),
          ),
        ));
  }
}
