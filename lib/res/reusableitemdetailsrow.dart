
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget reusableitemdetailsrow(String name, Color  color, bordercolor, BuildContext context,) {
  return Row(
    children: [
      Expanded(
        child: Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
          height: MediaQuery.of(context).size.height * .05,
          decoration: BoxDecoration(
            color: color,
             borderRadius: BorderRadius.circular(11),
          ),
          child: Center(child: Text(name)),
        ),
      ),
      Container(
                      // padding: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
                      // height: MediaQuery.of(context).size.height * .05,
                      margin: EdgeInsets.only(right: MediaQuery.of(context).size.height * .01,),
                      padding: EdgeInsets.all(MediaQuery.of(context).size.height * .006),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: bordercolor,width: 4),
                      color: color
                    ),
                    child: Center(child: Icon(Icons.volume_up,color: Colors.white, size: 30)),
                    ),
    ],
  );
}