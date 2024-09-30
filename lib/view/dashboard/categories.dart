import 'dart:convert';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:picture_dictionary/common/provider.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/repo/category_repo.dart';
import 'package:picture_dictionary/res/reusableCategoryTextBtn.dart';
import 'package:picture_dictionary/res/reusableVisibility.dart';
import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:picture_dictionary/res/reusablecateory.dart';
import 'package:picture_dictionary/res/reusableloading.dart';
import 'package:picture_dictionary/view/dashboard/items.dart';
import 'package:picture_dictionary/widget/sidebar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PictureRepo pictureRepo = PictureRepo();
  List<dynamic> item = [];

  late int id;

  late String selectedCategory;
  late Future<List<String>> categoriesFuture;
  late Future<List<Map<String, dynamic>>> itemsFuture;

  bool isLogin() {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    // fetchData();
    super.initState();
    selectedCategory = 'Fruits'; // Default selected category
    categoriesFuture = pictureRepo.fetchCategories();
    itemsFuture = pictureRepo.fetchItemsByCategory(selectedCategory);
    isLogin();
  }

  @override
  Widget build(BuildContext context) {
    // List<String> categories = item.map((e) => e['english'] as String).toList();
    return Scaffold(
        key: _scaffoldKey,
        // backgroundColor: Color(0xFFffb64d),
        appBar: reusableappbar(context, () {
          _scaffoldKey.currentState!.openDrawer();
        }, 'CATEGORIES'),
        drawer: SideBar(),
        body: Stack(
          children: [
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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<TextVisibilityProvider>(builder: (context, textVisibilityProvider, child) {
                    return FutureBuilder(
                    future: pictureRepo.fetchData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: reusableloadingrow(context, true));
                      } else if (!snapshot.hasData) {
                        return 
                        Center(child: Text('No Data Found'));
                      } else {
                        List<Map<String, dynamic>> data = snapshot.data!;
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          // itemCount: isLogin()
                          //     ? data.length
                          //     : 3, // Show all items if logged in, else show only 3
                          itemCount: data.length > 5 ? data.length - 2 : 0,
                          // item.length > 5 ? item.length - 2 : 0,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> type = data[index];
                            bool isLocked = !isLogin() &&
                                index >= 3; // Check if the item is locked
                            return GestureDetector(
                              onTap: () {
                                if (!isLocked) {
                                  String voiceUrl;
                        if (textVisibilityProvider .isFirstTextVisible) {
                          voiceUrl = '${type['arabic_voice']}';
                        } else if (textVisibilityProvider .isThirdTextVisible) {
                          voiceUrl = '${type['urdu_voice']}';
                        } else if (textVisibilityProvider .isForTextVisible) {
                          voiceUrl = '${type['turkish_voice']}';
                        } else if (textVisibilityProvider .isFiveTextVisible) {
                          voiceUrl = '${type['chinese_voice']}';
                        } else if (textVisibilityProvider .isSixTextVisible) {
                          voiceUrl = '${type['pashto_voice']}';
                        }else {
                          voiceUrl = '${type['english_voice']}';
                        }
                        pictureRepo.playAudioFromUrl(voiceUrl);
                                  setState(() {
                                    selectedCategory = type['english'];
                                    itemsFuture = pictureRepo
                                        .fetchItemsByCategory(selectedCategory);
                                    print(
                                        'itemsssssssssssssss ${itemsFuture.toString()}');
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
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: isLocked
                                  //     ? Colors.grey
                                  //     : colorController
                                  //         .whiteColor, // Use different color for locked items
                                  color: colorController.whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .44,
                                  // height: MediaQuery.of(context).size.height * .6,
                                  decoration: BoxDecoration(
                                    color: colorController.whiteColor,
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      if(isLogin() ==  true || isLogin() == false)...{
                                        Expanded(
                                          child: CachedNetworkImage(
                                        imageUrl: isLocked ? 'assets/a.png': type['image'],
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                                isLocked ? 'assets/a.png' : 'assets/placeholder_not_found.png'),
                                        width: double.infinity,
                                        // height: MediaQuery.of(context).size.height * .4,
                                        fit: BoxFit.contain,
                                        filterQuality: FilterQuality.high,
                                        placeholder: (context, url) =>
                                            Image.asset(
                                                'assets/placeholder_loading.png'),
                                      )),
                                      reusableCategoryTextBtn(
                                          context, 
                                          '${type['english'].toString().capitalize}',
                                          colorController.categoryBtnColor,'English1'),
                                      reusableVisibility(
                                        reusableCategoryTextBtn(
                                            context,
                                            '${type['arabic'].toString().capitalize}',
                                            colorController.arabicTextBtnColor,
                                            'arabicfont',
                                            ),
                                        Provider.of<TextVisibilityProvider>(
                                                context)
                                            .isFirstTextVisible,
                                      ),
                                      reusableVisibility(
                                        reusableCategoryTextBtn(
                                            context,
                                            '${type['urdu'].toString().capitalize}',
                                            colorController.urduTextBtnColor,'urdu2'),
                                        Provider.of<TextVisibilityProvider>(
                                                context)
                                            .isThirdTextVisible,
                                      ),
                                      reusableVisibility(
                                        reusableCategoryTextBtn(
                                            context,
                                            '${type['turkish'].toString().capitalize}',
                                            colorController
                                                .turkishTextBtnColor,''),
                                        Provider.of<TextVisibilityProvider>(
                                                context)
                                            .isForTextVisible,
                                      ),

                                      reusableVisibility(
                                        reusableCategoryTextBtn(
                                            context,
                                            '${type['chinese'].toString().capitalize}',
                                            colorController.chineseTextBtnColor,''),
                                        Provider.of<TextVisibilityProvider>(
                                                context)
                                            .isFiveTextVisible,
                                      ),
                                      reusableVisibility(
                                        reusableCategoryTextBtn(
                                            context,
                                            '${type['pashto'].toString().capitalize}',
                                            colorController
                                                .pashtoTextBtnColor,''),
                                        Provider.of<TextVisibilityProvider>(
                                                context)
                                            .isSixTextVisible,
                                      ),
                                      }
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                  },)
                  ),
            ),
            if (pictureRepo.isLoading == true)
              reusableloadingrow(context, pictureRepo.isLoading),
            reusableloadingrow(context, pictureRepo.isLoading)
          ],
        ));
  }
}
