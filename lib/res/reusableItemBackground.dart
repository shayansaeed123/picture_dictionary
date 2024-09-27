

import 'package:flutter/cupertino.dart';

Widget reusableItemBackground(BuildContext context, String text){

  return Positioned(
                    top: MediaQuery.of(context).size.height * 0.01,
                    left: MediaQuery.of(context).size.width * 0.01,
                    right: MediaQuery.of(context).size.width * 0.01,
                    child: Image.asset(text,filterQuality: FilterQuality.high,fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width * .44,
                    height: MediaQuery.of(context).size.height * .20,)
                    // Transform.rotate(
                    //   angle: 45  / 180,
                    //   // 45 * 3.1415927 / 180,
                    //   child: 
                      // Container(
                      //   width: MediaQuery.of(context).size.width * .44,
                      //   height: MediaQuery.of(context).size.height * .25,
                      //   decoration: BoxDecoration(
                      //     // color: colorController.whiteColor,
                      //     image: DecorationImage(image: AssetImage('assets/quad_round_img.png',),filterQuality: FilterQuality.high,fit: BoxFit.fill),
                      //     // Color(0xFFffb64d),
                      //     borderRadius: BorderRadius.circular(11),
                      //   ),
                      // ),
                    );
}