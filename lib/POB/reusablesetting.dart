

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget settingText(String text, Color color,double size,FontWeight weight,{double toppadding=25.0,double bottomPadding=0.0}){
  return Padding(
    padding: EdgeInsets.only(left: 14.0,top: toppadding,bottom: bottomPadding),
    child: Text(text, style: TextStyle(color: color,fontSize: size,fontWeight: weight),),
  );
}

Widget settingSwitch(bool isToggled, Function(bool) onToggle) {
  return Transform.scale(
    scale: 0.7, // Decrease switch size
    child: Switch(
      value: isToggled,
      activeTrackColor: Colors.blue,
      activeColor: Colors.white,
      inactiveTrackColor: Colors.white,
      inactiveThumbColor: Colors.black,
      onChanged: onToggle, // Call the passed function to update state
    ),
  );
}