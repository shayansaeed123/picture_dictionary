import 'package:flutter/material.dart';

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
        itemCount: myData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
              
               
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.2,
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 229, 237, 252),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top:8.0,left:32.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(myData[index]["imagePath"] ?? "assets/default.jpg"),
                          ),

                          SizedBox(width:MediaQuery.sizeOf(context).width*0.05),

                        
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(myData[index]["Recipe"] ?? "",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text(myData[index]["Name"] ?? "",
                                    style: TextStyle(fontSize: 15, color: Colors.grey.shade900)),
                               
                                SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),

                                Text(myData[index]["Given Date"] ?? "",
                                    style: TextStyle(fontSize: 15, color: Colors.grey)),
                               
                                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),

                               
                                GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => ReportPage()),
                                    // );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "See  Reports",
                                        style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(width: 4),
                                      Icon(Icons.arrow_forward, color: Colors.blue, size: 16),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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