import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:picture_dictionary/common/MySharedPrefrence.dart';
import 'package:picture_dictionary/common/provider.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/repo/category_repo.dart';
import 'package:picture_dictionary/res/reusableSidebarItems.dart';
import 'package:picture_dictionary/res/reusableVisibility.dart';
import 'package:picture_dictionary/res/reusableloading.dart';
import 'package:picture_dictionary/view/dashboard/items.dart';
import 'package:picture_dictionary/view/login/login_signup.dart';
import 'package:provider/provider.dart';

class SideBar extends StatefulWidget {
  //  final VoidCallback fetchDataCallback;
  // final List<String> categories;
  const SideBar({
    super.key,
    //  required this.fetchDataCallback, required this.categories
  });

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<String> categories = [];
  @override
  void initState() {
    super.initState();
    selectedCategory = 'Fruits'; // Default selected category
    categoriesFuture = pictureRepo.fetchCategories();
    itemsFuture = pictureRepo.fetchItemsByCategory(selectedCategory);
  }

  PictureRepo pictureRepo = PictureRepo();
  late String selectedCategory;
  late Future<List<String>> categoriesFuture;
  late Future<List<Map<String, dynamic>>> itemsFuture;

  void hello(String name) {
    setState(() {
      selectedCategory = name;
      itemsFuture = pictureRepo.fetchItemsByCategory(selectedCategory);
      print('itemsssssssssssssss ${itemsFuture.toString()}');
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsPage(
              categoriesFuture: categoriesFuture,
              itemsFuture: itemsFuture,
            ),
          ));
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Drawer(
      clipBehavior: Clip.antiAlias,
      backgroundColor: colorController.sidebarBg,
      child: Column(
        // padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.zero,
            child: DrawerHeader(
              decoration: BoxDecoration(
                  // color: Colors.blue,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    colorController.bgColorup,
                    colorController.bgColordown,
                  ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/ic_launcher.png',
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .5,
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  Text(
                    '${FirebaseAuth.instance.currentUser == null || FirebaseAuth.instance.currentUser!.displayName == null ? '' : FirebaseAuth.instance.currentUser!.displayName}',
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: FutureBuilder(
            future: pictureRepo.fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: reusableloadingrow(context, true));
              } else if (!snapshot.hasData) {
                return Center(child: Text('No Data Found'));
              } else {
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount:
                      snapshot.data!.length > 5 ? snapshot.data!.length - 2 : 0,
                  // widget.categories.length > 5 ? widget.categories.length - 2 : 0,
                  itemBuilder: (context, index) {
                    var categoryEng = snapshot.data![index]['english'];
                    var categoryAr = snapshot.data![index]['arabic'];
                    var categoryUr = snapshot.data![index]['urdu'];
                    var categoryTur = snapshot.data![index]['turkish'];

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        reusableSidebarItems(context, categoryEng, () {
                          hello(categoryEng);
                        }),
                        reusableVisibility(
                          reusableSidebarItems(context, categoryAr, () {
                            hello(categoryAr);
                          }),
                          Provider.of<TextVisibilityProvider>(context)
                              .isFirstTextVisible,
                        ),
                        reusableVisibility(
                          reusableSidebarItems(context, categoryUr, () {
                            hello(categoryUr);
                          }),
                          Provider.of<TextVisibilityProvider>(context)
                              .isThirdTextVisible,
                        ),
                        reusableVisibility(
                          reusableSidebarItems(context, categoryTur, () {
                            hello(categoryTur);
                          }),
                          Provider.of<TextVisibilityProvider>(context)
                              .isForTextVisible,
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                );
              }
            },
          )),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(FirebaseAuth.instance.currentUser != null
                ? 'Log Out'
                : 'Sign In'),
            onTap: () {
              // Handle logout tap
              setState(() {});
              MySharedPrefrence().logout();
              MySharedPrefrence().setUserLoginStatus(false);
              _handleSignOut();
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => WillPopScope(
                        onWillPop: () async => false, child: LoginPage())),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _handleSignOut() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    await _googleSignIn.signOut();
  }
}
