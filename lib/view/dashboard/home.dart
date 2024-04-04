
import 'package:flutter/material.dart';
import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:picture_dictionary/res/reusablehomebtn.dart';
import 'package:picture_dictionary/view/dashboard/categories.dart';
import 'package:picture_dictionary/widget/sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFffb64d),
      appBar: reusableappbar(context, (){
        // ZoomDrawer.of(context)!.open();
        _scaffoldKey.currentState!.openDrawer();
      },'Home'),
      // AppBar(
      //   backgroundColor: Color(0xFFffb64d),
      //   title: Text('Home'),
      //   leading: IconButton(
      //     icon: Icon(Icons.menu),
      //     onPressed: () {
      //       _scaffoldKey.currentState!.openDrawer();
      //     },
      //   ),
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     reusablehomeBtn('ENG', (){}),
      //     SizedBox(width: MediaQuery.of(context).size.width * .01,),
      //     reusablehomeBtn('SEARCH', (){}),
      //     SizedBox(width: MediaQuery.of(context).size.width * .01,),
      //   ],
      //   ),
      drawer: SideBar(),
      body: 
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // eb8815 f5d12d
                Color(0xFFe5af55),
                Color(0xFFe3e18e),
              ],
            ),
          ),
        child: Stack(
        children: [
          // Background image
          // Positioned.fill(
          //   child: Image.asset(
          //     'assets/splash.png',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // Content
          Positioned(
            top: MediaQuery.of(context).size.height * 0.18,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesPage(),));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.18,
                color: Colors.white.withOpacity(0.8),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'LEARN',
                      style: TextStyle(color: Color(0xFFb1282e), fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.12,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: CircleAvatar(
              // backgroundColor: Colors.cyan,
              radius: MediaQuery.of(context).size.height * 0.065,
              child: Image.asset('assets/bok1.png'),
              // child: Icon(Icons.book_outlined,size: 40,),
              )
            ),
            // Content
          Positioned(
            top: MediaQuery.of(context).size.height * 0.52,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.18,
              color: Colors.white.withOpacity(0.8),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'PLAY GAME',
                    style: TextStyle(color: Color(0xFFb1282e), fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.46,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: CircleAvatar(
              // backgroundColor: Colors.cyan,
            radius: MediaQuery.of(context).size.height * 0.065,
            child: Image.asset('assets/con.png'),
            )
          )
        ],
      ),
      )
    );
  }
}