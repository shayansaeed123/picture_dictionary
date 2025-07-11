import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:picture_dictionary/controller/color_controller.dart';

Widget reusableitemdetailsrow(String name, Color color, bordercolor,
    BuildContext context, Function onTap) {
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
          child: 
          // InkWell(
          //   onTap: (){
          //     onTap();
          //   },
          //   child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.03), // for left padding
                Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                      color: ColorController().whiteColor, fontSize: 16.5),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            // Container(
            // // margin: EdgeInsets.only(
            // //   right: MediaQuery.of(context).size.height * .01,
            // // ),
            // // padding: EdgeInsets.all(MediaQuery.of(context).size.height * .006),
            // // decoration: BoxDecoration(
            // //     shape: BoxShape.circle,
            // //     border: Border.all(color: bordercolor, width: 4),
            // //     color: color),
            // child: Center(
            //     child: Icon(Icons.volume_up, color: Colors.white, size:  MediaQuery.of(context).size.height * .03)),
            //         ),
              ],
            ),
          // )
        ),
      ),
      InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          margin: EdgeInsets.only(
            right: MediaQuery.of(context).size.height * .01,
          ),
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * .006),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: bordercolor, width: 4),
              color: color),
          child: Center(
              child: Icon(Icons.volume_up, color: Colors.white, size:  MediaQuery.of(context).size.height * .03)),
        ),
      ),
    ],
  );
}
