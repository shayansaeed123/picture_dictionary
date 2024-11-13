import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:picture_dictionary/common/provider.dart';
import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:picture_dictionary/widget/sidebar.dart';
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
        key: _scaffoldKey,
        drawer: SideBar(),
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
                // top: MediaQuery.of(context).size.height * 0.01,
              left: MediaQuery.of(context).size.width * 0.17,
              right: MediaQuery.of(context).size.width * 0.15,
                child: Image.asset('assets/rope.png',fit: BoxFit.contain,)),

                Positioned.fill(
                  top: MediaQuery.of(context).size.height * 0.24,
                  left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              bottom: MediaQuery.of(context).size.height * 0.03,
              // bottom: MediaQuery.of(context).size.height * 0.42,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                                        onTap: (){
                       print('ghgf');
                       Provider.of<TextVisibilityProvider>(context, listen: false).hideAllTextsAndShowFirst();
                       Navigator.pop(context);
                                        },
                                      child: Image.asset(
                                        width: MediaQuery.of(context).size.width * 0.58,
                                        'assets/ar_tab.png',)),
                      GestureDetector(
                  onTap: (){
                    Provider.of<TextVisibilityProvider>(context, listen: false).hideAllTextsAndShowSecond();
                     Navigator.pop(context);
                  },
                child: Image.asset(
                  width: MediaQuery.of(context).size.width * 0.58,
                  'assets/eng_tab.png',)),
                  GestureDetector(
                  onTap: (){
                    Provider.of<TextVisibilityProvider>(context, listen: false).hideAllTextsAndShowThird();
                     Navigator.pop(context);
                  },
                  child: Image.asset(
                    width: MediaQuery.of(context).size.width * 0.58,
                    'assets/ur_tab.png',)),
                    GestureDetector(
                  onTap: (){
                    Provider.of<TextVisibilityProvider>(context, listen: false).hideAllTextsAndShowFor();
                     Navigator.pop(context);
                  },
                  child: Image.asset(
               width: MediaQuery.of(context).size.width * 0.58,
              'assets/tur_tab.png',)),
              GestureDetector(
                  onTap: (){
                     print('ghgf');
                     Provider.of<TextVisibilityProvider>(context, listen: false).hideAllTextsAndShowFive();
                     Navigator.pop(context);
                  },
                child: Image.asset(
                  width: MediaQuery.of(context).size.width * 0.58,
                  'assets/chinese.png',)),
                  InkWell(
                  onTap: (){
                    Provider.of<TextVisibilityProvider>(context, listen: false).hideAllTextsAndShowSix();
                     Navigator.pop(context);
                  },
                child: Image.asset(
                  width: MediaQuery.of(context).size.width * 0.58,
                  'assets/pashto.png',))
                    ],
                  ),
                )
              //   Positioned.fill(
              //   top: MediaQuery.of(context).size.height * 0.00,
              // left: MediaQuery.of(context).size.width * 0.15,
              // right: MediaQuery.of(context).size.width * 0.15,
              // bottom: MediaQuery.of(context).size.height * 0.42,
              // child: GestureDetector(
              //     onTap: (){
              //        print('ghgf');
              //        Provider.of<TextVisibilityProvider>(context, listen: false).hideAllTextsAndShowFirst();
              //        Navigator.pop(context);
              //     },
              //   child: Image.asset('assets/ar_tab.png',))),
              //   Positioned.fill(
              //   // top: MediaQuery.of(context).size.height * 0.17,
              // left: MediaQuery.of(context).size.width * 0.15,
              // right: MediaQuery.of(context).size.width * 0.15,
              // // bottom: MediaQuery.of(context).size.height * 0.32,
              // child: GestureDetector(
              //     onTap: (){
              //       Provider.of<TextVisibilityProvider>(context, listen: false).hideAllTextsAndShowSecond();
              //        Navigator.pop(context);
              //     },
              //   child: Image.asset('assets/eng_tab.png',))),
              //   Positioned.fill(
              //   top: MediaQuery.of(context).size.height * 0.53,
              // left: MediaQuery.of(context).size.width * 0.15,
              // right: MediaQuery.of(context).size.width * 0.15,
              // // bottom: MediaQuery.of(context).size.height * 0.22,
              //   child: GestureDetector(
              //     onTap: (){
              //       Provider.of<TextVisibilityProvider>(context, listen: false).hideAllTextsAndShowThird();
              //        Navigator.pop(context);
              //     },
              //     child: Image.asset('assets/ur_tab.png',))),
              //   Positioned.fill(
              //   top: MediaQuery.of(context).size.height * 0.7,
              // left: MediaQuery.of(context).size.width * 0.15,
              // right: MediaQuery.of(context).size.width * 0.15,
              // // bottom: MediaQuery.of(context).size.height * 0.00001,
              //   child: GestureDetector(
              //     onTap: (){
              //       Provider.of<TextVisibilityProvider>(context, listen: false).hideAllTextsAndShowFor();
              //        Navigator.pop(context);
              //     },
              //     child: Image.asset('assets/tur_tab.png',))),




              //      Positioned.fill(
              //  top: MediaQuery.of(context).size.height * 0.92,
              // left: MediaQuery.of(context).size.width * 0.15,
              // right: MediaQuery.of(context).size.width * 0.15,
              // child: InkWell(
              //     onTap: (){
              //        print('ghgf');
              //        Provider.of<TextVisibilityProvider>(context, listen: false).hideAllTextsAndShowFive();
              //        Navigator.pop(context);
              //     },
              //   child: Image.asset('assets/ar_tab.png',))),
              //   Positioned.fill(
              //  top: MediaQuery.of(context).size.height * 0.76,
              // left: MediaQuery.of(context).size.width * 0.15,
              // right: MediaQuery.of(context).size.width * 0.15,
              // child: InkWell(
              //     onTap: (){
              //       Provider.of<TextVisibilityProvider>(context, listen: false).hideAllTextsAndShowSix();
              //        Navigator.pop(context);
              //     },
              //   child: Image.asset('assets/eng_tab.png',))),


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