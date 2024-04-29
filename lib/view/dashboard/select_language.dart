

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:picture_dictionary/common/provider.dart';
import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:provider/provider.dart';

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
            image: DecorationImage(image: AssetImage('assets/second_page.png'),fit:  BoxFit.fill),
          ),
          child: Stack(
            // alignment: Alignment.center,
            children: [
              Positioned.fill(
                top: MediaQuery.of(context).size.height * 0.01,
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
                child: Image.asset('assets/rope.png',fit: BoxFit.contain,)),
                Positioned.fill(
                // top: MediaQuery.of(context).size.height * 0.01,
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              bottom: MediaQuery.of(context).size.height * 0.42,
              child: InkWell(
                  onTap: (){
                     print('ghgf');
                     Provider.of<TextVisibilityProvider>(context, listen: false).hideAllTextsAndShowFirst();
                     Navigator.pop(context);
                  },
                child: Image.asset('assets/ar_tab.png',))),
                Positioned.fill(
                top: MediaQuery.of(context).size.height * 0.27,
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              bottom: MediaQuery.of(context).size.height * 0.32,
              child: InkWell(
                  onTap: (){
                    Provider.of<TextVisibilityProvider>(context, listen: false).hideAllTextsAndShowSecond();
                     Navigator.pop(context);
                  },
                child: Image.asset('assets/eng_tab.png',))),
                Positioned.fill(
                top: MediaQuery.of(context).size.height * 0.53,
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              bottom: MediaQuery.of(context).size.height * 0.22,
                child: InkWell(
                  onTap: (){
                    Provider.of<TextVisibilityProvider>(context, listen: false).hideAllTextsAndShowThird();
                     Navigator.pop(context);
                  },
                  child: Image.asset('assets/ur_tab.png',))),
                Positioned.fill(
                top: MediaQuery.of(context).size.height * 0.7,
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              // bottom: MediaQuery.of(context).size.height * 0.00001,
                child: InkWell(
                  onTap: (){
                    Provider.of<TextVisibilityProvider>(context, listen: false).hideAllTextsAndShowFor();
                     Navigator.pop(context);
                  },
                  child: Image.asset('assets/tur_tab.png',))),
              // Positioned(child: child)
            ],
          )
          // Center(
          //   child: Column(
              
          //     children: [
          //       Expanded(
          //         child: Container(
          //                   //         height:  double.infinity,
          //                   // width: double.infinity,
          //           decoration: BoxDecoration(
          //                     image: DecorationImage(image: AssetImage('assets/rope.png'),fit:  BoxFit.contain),
          //                   ),
          //                   child: Container(
          //                     child: Column(children: [

          //                     ],),
          //                   )
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}