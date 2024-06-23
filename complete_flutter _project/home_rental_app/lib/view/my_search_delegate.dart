import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:home_rental_app/controller/home_controller.dart';
import 'package:home_rental_app/view/home_details_page.dart';
import 'package:provider/provider.dart';


class MySearchDelegate extends SearchDelegate{

  List<String> searchResulttitlesList = [
    "Night Hill Villa",
    "Night Villa",
    "Jumeriah Golf Estates Villa",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    
    return [
      IconButton(onPressed: (){

        if(query.isEmpty){
            close(context, null);
        }else{
          query = '';
        }
    },
     icon: const Icon(Icons.clear))
    ];
    
  }

  @override
  Widget? buildLeading(BuildContext context) {
    
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: const Icon(Icons.arrow_back));
    
    
  }

  @override
  Widget buildResults(BuildContext context) {
   
    return const HomeDetailsScreen();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    var homeProductListObj = Provider.of<HomeController>(context,listen:false).homeDetailsModelObjList;

    List<String> suggestionstitlesList = searchResulttitlesList.where((search){
      final result = search.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

  return ListView.builder(
    itemCount: suggestionstitlesList.length,
    itemBuilder: (context,index){

      final suggestion = suggestionstitlesList[index];
      return ListTile(
        title: Text(suggestion),
        onTap: (){
          Provider.of<HomeController>(context,listen:false).onTapPushHomeDetailsObj(homeProductListObj[index]);
          showResults(context);
        },

      );
  });
    
  }

}