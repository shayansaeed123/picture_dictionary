


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:picture_dictionary/res/reusableloading.dart';

class GamePageThree extends StatefulWidget {
  final Future<List<String>> categoriesFuture;
  final Future<List<Map<String, dynamic>>> itemsFuture;
  const GamePageThree({super.key,required this.categoriesFuture, required this.itemsFuture});

  @override
  State<GamePageThree> createState() => _GamePageThreeState();
}

class _GamePageThreeState extends State<GamePageThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: widget.itemsFuture, builder: (context, snapshot) {
               if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: reusableloadingrow(context, true),);
               }else if(!snapshot.hasData){
                return Center(child: Text('data'));
               }else{
                List<Map<String, dynamic>> items = snapshot.data!;
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> item = items[index];
                  return Text(item['english'].toString(),style: TextStyle(color: Colors.black,fontSize: 37),);
                },);
               }}),
          )
        ],
      ),
    );
  }
}