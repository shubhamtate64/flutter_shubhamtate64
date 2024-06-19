
import 'package:flutter/material.dart';

class SingleSongs extends StatefulWidget {
  final String imagePath;
  final String title;
  final String date;
  final String descrption;

  const SingleSongs({super.key, required this.title, required this.date, required this.descrption, required this.imagePath});

  @override
  State<SingleSongs> createState() => _SingleSongsState();
}

class _SingleSongsState extends State<SingleSongs> {

  var titleTextStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: Color.fromRGBO(203,200,200,1)
  );

 var datedescriptionTextStyle = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10,
   
    color: Color.fromRGBO(132, 125, 125, 0.765)
  );


  @override
  Widget build(BuildContext context) {
    return ListTile(

      title: Text(widget.title),
      titleTextStyle: titleTextStyle,
      trailing: const Icon(Icons.more_vert_outlined,
      color: Color.fromRGBO(217, 217, 217, 1),
      ),
      subtitle: Row(
       
        children:[
        Text(widget.date,style: datedescriptionTextStyle,),
        const SizedBox(width: 3,),
       const  Text("*",
       style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color.fromRGBO(203,200,200,1)
       ),),
       const SizedBox(width: 5,),
        Text(widget.descrption,style: datedescriptionTextStyle,)]),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(widget.imagePath,
        height: 72,
        width: 67,),
      ),
    );
  }
}