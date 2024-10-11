import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/res/re_text.dart';

import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:picture_dictionary/view/dashboard/game_page_two.dart';
import 'package:picture_dictionary/view/dashboard/match_word_game_one.dart';
import 'package:picture_dictionary/view/dashboard/select_word_game_one.dart';
import 'package:picture_dictionary/view/dashboard/voice_game_one.dart';

import 'wheel_game_one.dart';


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
    body: Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GamePageTwo()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(MediaQuery.of(context).size.width * .01),
                    width: MediaQuery.of(context).size.width * .45,
                    height: MediaQuery.of(context).size.height * .2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      image: DecorationImage(
                        image: AssetImage('assets/gaming.jpg'),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: reusabletext(
                        'MATCH IMAGE',
                        colorController.whiteColor,
                        20,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => voicegameone()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(MediaQuery.of(context).size.width * .01),
                    width: MediaQuery.of(context).size.width * .45,
                    height: MediaQuery.of(context).size.height * .2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      image: DecorationImage(
                        image: AssetImage('assets/gaming.jpg'),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: reusabletext(
                        'VOICE GAME',
                         colorController.whiteColor,
                        20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => wheelgameone()), 
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(MediaQuery.of(context).size.width * .01),
                    width: MediaQuery.of(context).size.width * .45,
                    height: MediaQuery.of(context).size.height * .2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      image: DecorationImage(
                        image: AssetImage('assets/gaming.jpg'),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: reusabletext(
                        'WHEEL GAME',
                         colorController.whiteColor,
                        20,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectWordGameOne()), 
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(MediaQuery.of(context).size.width * .01),
                    width: MediaQuery.of(context).size.width * .45,
                    height: MediaQuery.of(context).size.height * .2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      image: DecorationImage(
                        image: AssetImage('assets/gaming.jpg'),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: reusabletext(
                        'SELECT WORD',
                         colorController.whiteColor,
                        20,
                      ),
                    ),
                  ),
                ),
                ],
               ),

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MatchWordGameOne()), 
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(MediaQuery.of(context).size.width * .01),
                    width: MediaQuery.of(context).size.width * .45,
                    height: MediaQuery.of(context).size.height * .2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      image: DecorationImage(
                        image: AssetImage('assets/gaming.jpg'),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: reusabletext(
                        'MATCH WORD',
                         colorController.whiteColor,
                        20,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MatchWordGameOne()), 
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(MediaQuery.of(context).size.width * .01),
                    width: MediaQuery.of(context).size.width * .45,
                    height: MediaQuery.of(context).size.height * .2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      image: DecorationImage(
                        image: AssetImage('assets/gaming.jpg'),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Expanded(
                      child: Center(
                        child: reusabletext(
                          '',
                           colorController.whiteColor,
                          20,
                        ),
                      ),
                    ),
                  ),
                ),
                ],
               )
          ],
        ),
      ),
    ),
  );
}
}