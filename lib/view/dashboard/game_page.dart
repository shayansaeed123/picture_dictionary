


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/res/re_text.dart';

import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:picture_dictionary/view/dashboard/game_page_two.dart';


class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableappbar(context, () {
          _scaffoldKey.currentState!.openDrawer();
        }, 'CATEGORIES'),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: 
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GamePageTwo(),));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(MediaQuery.of(context).size.width * .01,),
                        width: MediaQuery.of(context).size.width * .49,
                        height: MediaQuery.of(context).size.height * .2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11), 
                          image: DecorationImage(image: AssetImage('assets/game_bg.png'),filterQuality: FilterQuality.high,fit: BoxFit.fitWidth)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width * .01,),
                          child: Center(child: reusabletext('MATCH IMAGE', colorController.whiteColor, 20)),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
    );
  }
}