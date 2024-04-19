

import 'package:flutter/material.dart';
import 'package:picture_dictionary/common/provider.dart';
import 'package:picture_dictionary/view/dashboard/select_language.dart';
import 'package:provider/provider.dart';

Widget reusablehomeBtn(String name ,Function ontap){

  return ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)))
            ),
            onPressed: (){
              ontap();
            }, child: Text(name));
  // return Consumer<TextVisibilityProvider>(builder: (context, textVisibilityProvider, child) {
  //           return Row(
  //             children: [
  //               Visibility(
  //           visible: textVisibilityProvider.isFirstTextVisible,
  //           child: ElevatedButton(
  //           style: ButtonStyle(
  //             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)))
  //           ),
  //           onPressed: (){
  //             ontap();
  //           }, child: Text("AR"))
  //         ),
  //               Visibility(
  //           visible: textVisibilityProvider.isSecondTextVisible,
  //           child: ElevatedButton(
  //           style: ButtonStyle(
  //             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)))
  //           ),
  //           onPressed: (){
  //             ontap();
  //           }, child: Text("ENG"))
  //         ),
  //               Visibility(
  //           visible: textVisibilityProvider.isThirdTextVisible,
  //           child: ElevatedButton(
  //           style: ButtonStyle(
  //             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)))
  //           ),
  //           onPressed: (){
  //             ontap();
  //           }, child: Text("UR"))
  //         ),
  //               Visibility(
  //           visible: textVisibilityProvider.isForTextVisible,
  //           child: ElevatedButton(
  //           style: ButtonStyle(
  //             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)))
  //           ),
  //           onPressed: (){
  //             ontap();
  //           }, child: Text("TUR"))
  //         ),
  //             ]);
            
            
  //         },);
  
  
}