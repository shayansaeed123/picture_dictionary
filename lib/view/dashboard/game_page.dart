


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:picture_dictionary/res/reusableappbar.dart';


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
        ),
    );
  }
}