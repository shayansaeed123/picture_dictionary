


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:picture_dictionary/view/dashboard/game_page_two.dart';

 reusableAnimation(BuildContext context,String animation,String btntxt,String countValue){
  return showDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      // title: Text(titletxt),
      content: Lottie.asset(animation),
      actions: [
        ElevatedButton(
          onPressed: () {
      Navigator.of(context).pop();
Navigator.of(context).pop();
          },
          child: Text(btntxt),
        ),
      ],
    ),
  );
}