


import 'package:flutter/material.dart';
import 'package:picture_dictionary/view/login/login_signup.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.push(context, 
      MaterialPageRoute(builder: 
      (context) => WillPopScope(onWillPop: 
      () async => false, child: LoginPage()),));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/sky.png"), alignment: Alignment.topCenter,fit: BoxFit.fitHeight)
        ),
        child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/ground.png"),  alignment: Alignment.bottomCenter,fit: BoxFit.contain)
        ),
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * .1),
          child: Image.asset('assets/logo_pic_dic.png',alignment: Alignment.topCenter,),
        ),
        )
      ),
    );
  }
}