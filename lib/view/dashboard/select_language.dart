

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:picture_dictionary/widget/sidebar.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: reusableappbar(context, (){
          _scaffoldKey.currentState!.openDrawer();
        }, 'Choose Language'),
        body: Container(
          height:  double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/second_page.png'),fit:  BoxFit.cover),
          ),
          child: Center(
            child: Column(
              
              children: [
                Expanded(
                  child: Container(
                            //         height:  double.infinity,
                            // width: double.infinity,
                    decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/rope.png'),fit:  BoxFit.contain),
                            ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}