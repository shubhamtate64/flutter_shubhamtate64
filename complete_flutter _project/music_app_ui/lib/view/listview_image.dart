
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class listViewImage extends StatefulWidget {
  final String? title;
   final String? imagePath;
   final int? date;
const listViewImage({ this.imagePath,super.key, required this.title, required this.date});

  @override
  State<listViewImage> createState() => _listViewImageState();
}

class _listViewImageState extends State<listViewImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(widget.imagePath!,
            height: 140,
          width: 119,
            fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5,),
           Text(widget.title!,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(203,200,200,1)
          ),),
          Text("${widget.date!}",
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(132,125,125,1)
          ),),
        ],
      ),
    );
  }
}