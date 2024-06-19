import "dart:developer";

import "package:flutter/material.dart";
import "package:provider/provider.dart";

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    log("IN MYAPP Build");
    return MultiProvider(
      providers:[
        Provider(
          create:(context){
            return const Player(
              playerName:"Virat",
              jerNo:18
            );
          }
        ),
        ChangeNotifierProvider(
          create:(context) {
            return Match(
              matchNo:200,
              runs:8800
            );
          }
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner:false,
        home: MatchSummary(),
      ),
    );
  }
}


class Player{

  final String playerName;
  final int jerNo;

  const Player({required this.playerName,required this.jerNo});
}

class Match extends ChangeNotifier{

   int matchNo;
   int runs;

  Match({required this.matchNo,required this.runs});

  void changeData({required matchNo , required runs}){
    this.matchNo = matchNo;
    this.runs = runs;
    notifyListeners();
  }
}

class MatchSummary extends StatefulWidget{

  const MatchSummary({super.key});

  @override
  State<MatchSummary> createState()=> _MatchSummaryState();

}

class _MatchSummaryState extends State<MatchSummary>{

  @override
  Widget build(BuildContext context){
    log("in Scaffold _MatchSummmary Build");
    return Scaffold(
      appBar:AppBar(
        title:const Text("Consumer Demo 1"),
        centerTitle: true,
        backgroundColor:Colors.blue
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text(Provider.of<Player>(context).playerName),
            const SizedBox(height:10),
            Text("${Provider.of<Player>(context).jerNo}"),
            const SizedBox(height:20),
            // Text("${Provider.of<Match>(context).matchNo}"),
            // const SizedBox(height:10),
            // Text("${Provider.of<Match>(context).runs}"),
          Consumer(builder: (context,match,child){
            log("in Consumer Build");    
           return Column(children:[
            Text("${Provider.of<Match>(context).matchNo}"),
            const SizedBox(height:10),
            Text("${Provider.of<Match>(context).runs}"),
           ]);
          },),

            const SizedBox(height:20),
            ElevatedButton(
              onPressed:(){
                Provider.of<Match>(context,listen: false).changeData(matchNo: 250, runs: 8900);
              },
              child:const Text("Change MatchNo or Runs")
            ),
          ],
        ),
      ),
    );
  }
}