import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:picture_dictionary/common/MySharedPrefrence.dart';
import 'package:picture_dictionary/common/provider.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/res/re_text.dart';
import 'package:picture_dictionary/res/reusableVisibility.dart';
import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:picture_dictionary/view/dashboard/categories.dart';
import 'package:picture_dictionary/view/dashboard/game_page.dart';
import 'package:picture_dictionary/view/login/login_signup.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
extension TruncateText on String {
  String truncateWithEllipsis(int maxLength) {
    if (length <= maxLength) return this;
    return substring(0, maxLength - 5) + '...'; // Subtract 3 to account for ellipsis
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

int _selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(MySharedPrefrence().getUserLoginStatus());
  }

  
 void _handleSignOut() async {
  MySharedPrefrence().logout();
  MySharedPrefrence().setUserLoginStatus(false);
  GoogleSignIn _googleSignIn = GoogleSignIn();
  await _googleSignIn.signOut();
   FirebaseAuth auth = FirebaseAuth.instance;
  await auth.signOut().then((value) {
     Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => WillPopScope(
                                          onWillPop: () async => false,
                                          child: LoginPage())),
                                );
  });
  print('User signed out');
}


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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Image.asset('assets/ic_launcher.png',alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * .5,
                height: MediaQuery.of(context).size.height * .1,),
                Text('${FirebaseAuth.instance.currentUser == null || FirebaseAuth.instance.currentUser!.displayName == null? '' : FirebaseAuth.instance.currentUser!.displayName }',)
              ],),
          ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Home'),
              onTap: () {
                // Handle settings tap
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
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
          // Spacer(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('About Us'),
            onTap: () {
              // Handle logout tap
            },
          ),
          // Spacer(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(FirebaseAuth.instance.currentUser != null ? 'Log Out' : 'Sign In'),
            onTap: () {
              // Handle logout tap
              // MySharedPrefrence().logout();
              _handleSignOut();
                               
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      reusabletext('LEARN ', colorController.homeTxtColor, 24.0),
                                        SizedBox(height: 16.0),
                                        Row(children: [
                                          reusableVisibility(reusabletext('| يتعلم', colorController.homeTxtColor, 24.0), 
                                          Provider.of<TextVisibilityProvider>(context).isFirstTextVisible,),
                                          reusableVisibility(reusabletext('| سیکھیں', colorController.homeTxtColor, 24.0), 
                                          Provider.of<TextVisibilityProvider>(context).isThirdTextVisible,),
                                          reusableVisibility(reusabletext('| öğrenmek', colorController.homeTxtColor, 24.0), 
                                          Provider.of<TextVisibilityProvider>(context).isForTextVisible,),
                                        ],),
        
                    ],)
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
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Games(),));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.18,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
                  color: Colors.white.withOpacity(0.8),
                ),
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    reusabletext('PLAY GAME ', colorController.homeTxtColor, 24.0),
                    // SizedBox(height: 16.0),
                    Row(children: [
                      reusableVisibility(reusabletext('| ألعب لعبة', colorController.homeTxtColor, 24.0), 
                                            Provider.of<TextVisibilityProvider>(context).isFirstTextVisible,),
                                            reusableVisibility(reusabletext('| کھیل کھیلیں', colorController.homeTxtColor, 24.0), 
                                            Provider.of<TextVisibilityProvider>(context).isThirdTextVisible,),
                                            reusableVisibility(reusabletext('| Oyun oynamak'.truncateWithEllipsis(11), colorController.homeTxtColor, 24.0), 
                                            Provider.of<TextVisibilityProvider>(context).isForTextVisible,),
                    ],),
                //     Consumer<TextVisibilityProvider>(
                //           builder: (context, textVisibilityProvider, child) {
                //             return Row(
                // children: [
                //   Visibility(
                //     visible: textVisibilityProvider.isFirstTextVisible,
                //     child: Text('| ألعب لعبة', style: TextStyle(color: colorController.homeTxtColor, fontSize: 24.0, fontWeight: FontWeight.bold),),
                //   ),
                //   Visibility(
                //     visible: textVisibilityProvider.isSecondTextVisible,
                //     child: Text('', style: TextStyle(color: colorController.homeTxtColor, fontSize: 24.0, fontWeight: FontWeight.bold),),
                //   ),
                //    Visibility(
                //     visible: textVisibilityProvider.isThirdTextVisible,
                //     child: Text('| کھیل کھیلیں', style: TextStyle(color: colorController.homeTxtColor, fontSize: 24.0, fontWeight: FontWeight.bold),),
                //   ),
                //   Visibility(
                //     visible: textVisibilityProvider.isForTextVisible,
                //     child: Text('| Oyun oynamak'.truncateWithEllipsis(11),overflow: TextOverflow.ellipsis, style: TextStyle(color: colorController.homeTxtColor, fontSize: 24.0, fontWeight: FontWeight.bold),),
                //   ),
                // ],
                //             );
                //           },
                //         ),
                  ],
                ),
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