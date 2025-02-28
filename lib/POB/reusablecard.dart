

import 'package:flutter/material.dart';

Widget reusableCard(BuildContext context,String img,String title,String name,String date,VoidCallback onTap) {
  return  Padding(
                  padding: const EdgeInsets.only(top: 16.0,),
                  child: Container(
                    margin: EdgeInsets.only(left: 16.0,right:16.0),
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
                            backgroundImage: AssetImage(img),
                          ),

                          SizedBox(width:MediaQuery.sizeOf(context).width*0.05),

                        
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(title,
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text(name,
                                    style: TextStyle(fontSize: 15, color: Colors.grey.shade900)),
                               
                                SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),

                                Text(date,
                                    style: TextStyle(fontSize: 15, color: Colors.grey)),
                               
                                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),

                               
                                GestureDetector(
                                  onTap:onTap,                                //  () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => ReportPage()),
                                    // );
                                  // },
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
                );
                }