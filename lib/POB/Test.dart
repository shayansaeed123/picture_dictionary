import 'package:flutter/material.dart';
import 'package:picture_dictionary/POB/reusablecard.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
              reusableCard(context, 'assets/default.jpg', 'shayan', '', '1/01/2025', (){})
               
               
              ],
            ),
          );
        },
      ),
    );
  }
}