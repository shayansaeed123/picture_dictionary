import 'package:flutter/material.dart';



class Visit extends StatefulWidget {
  const Visit({super.key});

  @override
  State<Visit> createState() => _VisitState();
}

class _VisitState extends State<Visit> {
  List<Map<String, String>> myData = [
    {
      "text1": "Date 1",
      "text2": "Status 1",
      "imagePath": "assets/userImg.jpeg",
      "name": "Tawfiq Bahri",
      "profession": "Family Doctor",
      "specialty": "Cardiologist",
    },
    {
      "text1": "Date 2",
      "text2": "Status 2",
      "imagePath": "assets/userImg.jpeg",
      "name": "Ali Khan",
      "profession": "Surgeon",
      "specialty": "Neurosurgeon",
    },
    {
      "text1": "Date 3",
      "text2": "Status 3",
      "imagePath": "assets/userImg.jpeg",
      "name": "Ayesha Ahmed",
      "profession": "Pediatrician",
      "specialty": "Child Specialist",
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
              
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  width: MediaQuery.sizeOf(context).width * 0.23,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(myData[index]["text1"] ??"",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(myData[index]["text2"] ?? "",
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(myData[index]["imagePath"] ?? "assets/default.jpg"),
                          ),

                          SizedBox(width: 10),

                        
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(myData[index]["name"] ?? "",
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(myData[index]["profession"] ?? "",
                                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                                Text(myData[index]["specialty"] ?? "",
                                    style: TextStyle(fontSize: 14, color: Colors.grey)),

                                SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),

                               
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
                                        "See full Reports",
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



