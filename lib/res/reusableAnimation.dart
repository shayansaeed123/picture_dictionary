


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:picture_dictionary/view/dashboard/game_page_two.dart';

 reusableAnimationWin(BuildContext context,String animation,String btntxt,String countValue){
  return showDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      // content: Lottie.asset(animation),
      content: Image.asset(animation, fit: BoxFit.cover, filterQuality: FilterQuality.high,),
      actions: [
        ElevatedButton(
          onPressed: () {
      Navigator.pop(context, countValue);
      Navigator.pop(context, countValue);
          },
          child: Text(btntxt),
        ),
      ],
    ),
  );
}

reusableAnimation(BuildContext context,String animation,String btntxt,String countValue){
  return showDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      content: Lottie.asset(animation),
      actions: [
        ElevatedButton(
          onPressed: () {
      Navigator.pop(context, countValue);
      Navigator.pop(context, countValue);
          },
          child: Text(btntxt),
        ),
      ],
    ),
  );
}