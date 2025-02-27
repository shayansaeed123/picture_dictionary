
import 'package:flutter/material.dart';
import 'package:picture_dictionary/POB/Visit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, 
      child: Scaffold(
        body: Column(
          children: [
           
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 16.0, right: 16.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/userImg.jpeg'),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tawfiq Bahri", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text("bahri tawfiq@gmail.com", style: TextStyle(color: Colors.grey, fontSize: 14)),
                    Text("92357866557", style: TextStyle(color: Colors.blue, fontSize: 12)),
                  ],
                ),
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  child: Icon(Icons.edit, color: Colors.black),
                ),
              ),
            ),
            
                 TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(text: "Visit"),
                Tab(text: "Examination"),
                Tab(text: "Test "),
                Tab(text: "Prescription"),
              ],
            ),

         
            Expanded(
              child: TabBarView(
                children: [
                 Visit(),
                //  Examination(),
                //  Test(),
                //  Prescription(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}