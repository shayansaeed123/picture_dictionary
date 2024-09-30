
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:picture_dictionary/controller/color_controller.dart';

Widget reusableloadingrow(BuildContext context, bool isLoading) {
  return isLoading == true
      ?  
        CupertinoAlertDialog(
            title: Column(
              children: [
                Text(
                  ' Loading ...',
                  style: TextStyle(
                      color: colorController.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 32),
                ),
                Lottie.asset('assets/pd_loading.json',
                alignment: Alignment.center,
                animate: true,
                filterQuality: FilterQuality.high,
                fit: BoxFit.contain,height: MediaQuery.of(context).size.height *0.05,
                repeat: true,)
              ],
            ),
          )
      
      : Container();
}
