

import 'package:flutter/material.dart';

Widget reusablenextitembtn(BuildContext context, Function ontap, String image){
  return InkWell(
    onTap: (){
      ontap();
    },
    child: Image.asset(image, fit: BoxFit.contain,filterQuality: FilterQuality.high,));
  // Container(
  //                       padding: EdgeInsets.all(
  //                           MediaQuery.of(context).size.height * .01),
  //                       // height: MediaQuery.of(context).size.height * .07,
  //                       decoration: BoxDecoration(
  //                         shape: BoxShape.circle,
  //                         border:
  //                             Border.all(color: Color(0xFFffb64d), width: 4),
  //                         gradient: LinearGradient(
  //                           begin: Alignment.topCenter,
  //                           end: Alignment.bottomCenter,
  //                           colors: [
  //                             Color(0xFFeb8815),
  //                             Color(0xFFeb8815),
  //                             // Color(0xFFe3e18e),
  //                           ],
  //                         ),
  //                       ),
  //                       child: Center(
  //                           child: InkWell(
  //                             onTap: (){
  //                               return ontap();
  //                             },
  //                             child: Icon(
  //                                                       icon,
  //                                                       size: 35,
  //                                                       color: Color(0xFFe3e18e),
  //                                                     ),
  //                           )),
  //                     );
}