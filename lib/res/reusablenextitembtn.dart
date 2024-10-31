

import 'package:flutter/material.dart';

Widget reusablenextitembtn(BuildContext context, Function ontap, String image){
  return InkWell(
    onTap: (){
      ontap();
    },
    child: Image.asset(image, fit: BoxFit.contain,filterQuality: FilterQuality.high,));
}