import 'package:flutter/material.dart';
import 'package:picture_dictionary/POB/reusablecard.dart';

class Prescription extends StatefulWidget {
  const Prescription({super.key});

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  List<Map<String, String>> myData = [
    
    {
    
      "imagePath": "assets/userImg.jpeg",
      "Recipe": "Pharyngitis",
      "Name":"Tawqif Bahri",
      "Given Date": " Given at 25/06/2024",
    },
     {
    
      "imagePath": "assets/userImg.jpeg",
      "Recipe": "Tuberculosis",
      "Name":"Tawqif Bahri",
      "Given Date": "Given at 15/04/2024",
    },
 
  ];
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
              
               reusableCard(context, 'assets/default.jpg', 'shayan', 'doctor', '1/01/2025', (){})
              
              ],
            ),
          );
        },
      ),
    );
  }
}