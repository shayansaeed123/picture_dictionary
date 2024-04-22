

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picture_dictionary/common/provider.dart';
import 'package:picture_dictionary/res/reusableVisibility.dart';
import 'package:picture_dictionary/res/reusablehomebtn.dart';
import 'package:picture_dictionary/view/dashboard/search.dart';
import 'package:picture_dictionary/view/dashboard/select_language.dart';
import 'package:provider/provider.dart';

 reusableappbar(BuildContext context, Function ontap,String name){
  return AppBar(
        backgroundColor: Color(0xFFffb64d),
        title: Text('$name',style: TextStyle(fontSize: 18),),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // _scaffoldKey.currentState!.openDrawer();
            ontap();
          },
        ),
        automaticallyImplyLeading: false,
        actions: [
          Row(children: [
            reusableVisibility(reusablehomeBtn('AR', (){
              Navigator.push(context, MaterialPageRoute(builder:  (context) => SelectLanguage(),));
            }), Provider.of<TextVisibilityProvider>(context).isFirstTextVisible,),
            reusableVisibility(reusablehomeBtn('ENG', (){
              Navigator.push(context, MaterialPageRoute(builder:  (context) => SelectLanguage(),));
            }), Provider.of<TextVisibilityProvider>(context).isSecondTextVisible,),
            reusableVisibility(reusablehomeBtn('UR', (){
              Navigator.push(context, MaterialPageRoute(builder:  (context) => SelectLanguage(),));
            }), Provider.of<TextVisibilityProvider>(context).isThirdTextVisible,),
            reusableVisibility(reusablehomeBtn('TUR', (){
              Navigator.push(context, MaterialPageRoute(builder:  (context) => SelectLanguage(),));
            }), Provider.of<TextVisibilityProvider>(context).isForTextVisible,),
            reusableVisibility(reusablehomeBtn('ENG', (){
              Navigator.push(context, MaterialPageRoute(builder:  (context) => SelectLanguage(),));
            }), Provider.of<TextVisibilityProvider>(context).englishbtn,),
          ],),
          // Consumer<TextVisibilityProvider>(builder: (context, textVisibilityProvider, child) {
          //   return Row(
          //     children: [
          //       Visibility(
          //   visible: textVisibilityProvider.isFirstTextVisible,
          //   child: reusablehomeBtn('AR', (){
          //     Navigator.push(context, MaterialPageRoute(builder:  (context) => SelectLanguage(),));
          //   }),
          // ),
          //       Visibility(
          //   visible: textVisibilityProvider.isSecondTextVisible,
          //   child: reusablehomeBtn('ENG', (){
          //     Navigator.push(context, MaterialPageRoute(builder:  (context) => SelectLanguage(),));
          //   }),
          // ),
          //       Visibility(
          //   visible: textVisibilityProvider.isThirdTextVisible,
          //   child: reusablehomeBtn('UR', (){
          //     Navigator.push(context, MaterialPageRoute(builder:  (context) => SelectLanguage(),));
          //   }),
          // ),
          //       Visibility(
          //   visible: textVisibilityProvider.isForTextVisible,
          //   child: reusablehomeBtn('TUR', (){
          //     Navigator.push(context, MaterialPageRoute(builder:  (context) => SelectLanguage(),));
          //   }),
          // ),
          //  Visibility(
          //   visible: textVisibilityProvider.englishbtn,
          //   child: reusablehomeBtn('ENG', (){
          //     Navigator.push(context, MaterialPageRoute(builder:  (context) => SelectLanguage(),));
          //   }),
          // ),
          //     ]);
            
          // },),
          SizedBox(width: MediaQuery.of(context).size.width * .01,),
          reusablehomeBtn('SEARCH', (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchItem()));
          }),
          SizedBox(width: MediaQuery.of(context).size.width * .01,),
        ],
        );
}