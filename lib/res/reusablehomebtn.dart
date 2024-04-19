

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
}