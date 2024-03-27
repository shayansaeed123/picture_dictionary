

import 'package:flutter/material.dart';
import 'package:picture_dictionary/res/re_text.dart';

Widget reusableLoginBtn(String text,String img, Color color, Function ontap){
  return InkWell(
     onTap: () {
       ontap();
     },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 17,vertical: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        reusabletext(text, Colors.black45, 18),
        Image.asset(img),
      ],),
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: Colors.white,width: 3)
      ),
    ),
  );
}