import 'package:flutter/material.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:picture_dictionary/view/dashboard/categories.dart';

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
      // backgroundColor: Color(0xFFffb64d),
      appBar: reusableappbar(context, (){
        // ZoomDrawer.of(context)!.open();
        _scaffoldKey.currentState!.openDrawer();
      },'Home'),
      drawer: Drawer(
        backgroundColor: colorController.sidebarBg,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                  colorController.bgColorup,
                  colorController.bgColordown,
                ])
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Home'),
              onTap: () {
                // Handle settings tap
              },
            ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Setting'),
            onTap: () {
              // Handle help tap
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Privacy Policy'),
            onTap: () {
              // Handle about tap
            },
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('About Us'),
            onTap: () {
              // Handle logout tap
            },
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sign in'),
            onTap: () {
              // Handle logout tap
            },
          ),
        ],
      ),
    ),
      body: 
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // eb8815 f5d12d
                 colorController.bgColorup,
                  colorController.bgColordown,
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
                decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
                color: Colors.white.withOpacity(0.8),
              ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'LEARN',
                      style: TextStyle(color: colorController.homeTxtColor, fontSize: 24.0, fontWeight: FontWeight.bold),
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
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
                color: Colors.white.withOpacity(0.8),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'PLAY GAME',
                    style: TextStyle(color: colorController.homeTxtColor, fontSize: 24.0, fontWeight: FontWeight.bold),
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