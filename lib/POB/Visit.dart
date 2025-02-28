import 'package:flutter/material.dart';
import 'package:picture_dictionary/POB/reusablecard.dart';



class Visit extends StatefulWidget {
  const Visit({super.key});

  @override
  State<Visit> createState() => _VisitState();
}

class _VisitState extends State<Visit> {

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
              
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  width: MediaQuery.sizeOf(context).width * 0.23,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Date 1",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("Status 1",
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: MediaQuery.sizeOf(context).width * 0.01),

               Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.2,
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 229, 237, 252),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: reusableCard(context, 'assets/default.jpg', 'shayan', 'doctor', '1/01/2025', (){})
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



