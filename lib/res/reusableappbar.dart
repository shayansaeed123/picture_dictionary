

import 'package:flutter/material.dart';
import 'package:picture_dictionary/res/reusablehomebtn.dart';
import 'package:picture_dictionary/view/dashboard/search.dart';
import 'package:picture_dictionary/view/dashboard/select_language.dart';

 reusableappbar(BuildContext context, Function ontap,String name){
  return AppBar(
        backgroundColor: Color(0xFFffb64d),
        title: Text('$name'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // _scaffoldKey.currentState!.openDrawer();
            ontap();
          },
        ),
        automaticallyImplyLeading: false,
        actions: [
          reusablehomeBtn('ENG', (){
            Navigator.push(context, MaterialPageRoute(builder:  (context) => SelectLanguage(),));
          }),
          SizedBox(width: MediaQuery.of(context).size.width * .01,),
          reusablehomeBtn('SEARCH', (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchItem()));
          }),
          SizedBox(width: MediaQuery.of(context).size.width * .01,),
        ],
        );
}