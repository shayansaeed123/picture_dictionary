


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget reusableCategoryTextBtn(BuildContext context, String text, Color color){
  return Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height*0.05,
                            margin: EdgeInsets.all(MediaQuery.of(context).size.height * .001),
                            padding: EdgeInsets.all(MediaQuery.of(context).size.height * .003),
                            decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(8.0)),
                            child: Center(child: Text(text,textAlign: TextAlign.center, softWrap: true, style: TextStyle(color: Colors.white, fontFamily: 'English1',),)),
                          );
}