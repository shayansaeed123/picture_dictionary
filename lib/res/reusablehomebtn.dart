

import 'package:flutter/material.dart';

Widget reusablehomeBtn(String name, Function ontap){
  return ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)))
            ),
            onPressed: (){
              ontap();
            }, child: Text(name));
}