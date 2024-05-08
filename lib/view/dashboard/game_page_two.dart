

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:picture_dictionary/common/MySharedPrefrence.dart';
import 'package:picture_dictionary/common/provider.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/repo/category_repo.dart';
import 'package:picture_dictionary/res/reusableCategoryTextBtn.dart';
import 'package:picture_dictionary/res/reusableVisibility.dart';
import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:picture_dictionary/res/reusableloading.dart';
import 'package:picture_dictionary/view/dashboard/game_page_three.dart';
import 'package:picture_dictionary/view/dashboard/items.dart';
import 'package:picture_dictionary/widget/sidebar.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class GamePageTwo extends StatefulWidget {
  const GamePageTwo({super.key});

  @override
  State<GamePageTwo> createState() => _GamePageTwoState();
}

class _GamePageTwoState extends State<GamePageTwo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PictureRepo pictureRepo = PictureRepo();
  List<dynamic> item = [];

  late int id;

  String selectedCategory = '';
  late Future<List<String>> categoriesFuture;
  late Future<List<Map<String, dynamic>>> itemsFuture;
  String cat_id = '';
  String userid = '';

  bool isLogin() {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    
    // String userid = user!.uid.toString();
    // print('User Id $userid');
    if (user != null) {
      userid = user.uid.toString();
      print('User Id $userid');
      return true;
    }
    userid = '101';
    print('shayan id witout login $userid');
    return false;
  }

//   Future<List<Map<String, dynamic>>> fetchTimeWiseData() async {

//     final apiUrl = 'https://eleprogram.turk.pk/api/assignment1.php';
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         body: {
//           'type_id':  cat_id.toString()
//           },
//       );

//       if (response.statusCode == 200) {
//         final List<Map<String, dynamic>> data =
//             json.decode(response.body).cast<Map<String, dynamic>>();
//         print(data);
//   return 
//  data;
//       }
//        else {
//         throw Exception('Failed to load data from API');
//       }
//     } catch (e) {
//       throw Exception('Error fetching data: $e');
//     }
//   }

Future<List<Map<String, dynamic>>> fetchGameCategories(String categoryId,) async {
  try {
    // _isLoading = false;
    // print('myshared ${MySharedPrefrence().get_cat_id()}');
    final response = await http.post(
      Uri.parse('https://kulyatudawah.com/public/vocgame/apis/get_limited_items.php'),
      body: {
        'type_id': selectedCategory.toString(),
        // MySharedPrefrence().get_cat_id(),
      },
    );
setState(() {});
    print('ID1 ${selectedCategory}');
setState(() {});
    if (response.statusCode == 200) {
      dynamic jsonResponse = jsonDecode(response.body);
      List<Map<String, dynamic>> items = [];
      for (var type in jsonResponse) {
        setState(() {});
          print('ID2 ${categoryId}');
        if (type['type_id'] == categoryId) { // Convert type_id to String
          items.addAll(type['items'].cast<Map<String, dynamic>>());
          items.addAll(type['items'].cast<Map<String, dynamic>>());
          print('Added items: $items');
          break;
        }
        }
      print('Game All Items $items');
      return items;
    } else {
      throw Exception('failed to load data');
    }
  } catch (e) {
    print('Error: $e');
    throw Exception('failed to load data');
  } finally {
    // _isLoading = false;
  }
   }





   

  @override
  void initState() {
    // fetchData();
    super.initState();
    // selectedCategory = ''; // Default selected category
    categoriesFuture = pictureRepo.fetchCategories();
    itemsFuture = fetchGameCategories(selectedCategory);
    
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
                            // setState(() {});
                            //  MySharedPrefrence().set_cat_id(type['id']);
                            
                            cat_id = type['id'];
                            print(cat_id);
                            bool isLocked = !isLogin() &&
                                index >= 3; // Check if the item is locked
                            return GestureDetector(
                              onTap: () {
                                // if (!isLocked) {
                                  String voiceUrl;
                        if (textVisibilityProvider .isFirstTextVisible) {
                          voiceUrl = '${type['arabic_voice']}';
                        } else if (textVisibilityProvider .isThirdTextVisible) {
                          voiceUrl = '${type['urdu_voice']}';
                        } else if (textVisibilityProvider .isForTextVisible) {
                          voiceUrl = '${type['turkish_voice']}';
                        } else {
                          voiceUrl = '${type['english_voice']}';
                        }

                        pictureRepo.playAudioFromUrl(voiceUrl);
                                  // if(Provider.of<TextVisibilityProvider>(context).isFirstTextVisible){
                                  //   pictureRepo.playAudioFromUrl('${type['arabic_voice']}');
                                  // }else if(Provider.of<TextVisibilityProvider>(context).isThirdTextVisible){
                                  //   pictureRepo.playAudioFromUrl('${type['urdu_voice']}');
                                  // }else if(Provider.of<TextVisibilityProvider>(context).isForTextVisible){
                                  //   pictureRepo.playAudioFromUrl('${type['turkish_voice']}');
                                  // }else{
                                  //   pictureRepo.playAudioFromUrl(
                                  //     '${type['english_voice']}');
                                  // }
                                  setState(() {
                                    selectedCategory = type['id'];
                                    itemsFuture = fetchGameCategories(selectedCategory);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => GamePageThree(
                                            // categoriesFuture: categoriesFuture,
                                            itemsFuture: itemsFuture,
                                            selectedCategory: selectedCategory,
                                          ),
                                        ));
                                  });
                                },
                              // },
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
                                        imageUrl: 
                                        // isLocked ? 'assets/a.png':
                                         type['image'],
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                                // isLocked ? 'assets/a.png' : 
                                                'assets/placeholder_not_found.png'),
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
                                          colorController.categoryBtnColor),
                                      reusableVisibility(
                                        reusableCategoryTextBtn(
                                            context,
                                            '${type['arabic'].toString().capitalize}',
                                            colorController.arabicTextBtnColor),
                                        Provider.of<TextVisibilityProvider>(
                                                context)
                                            .isFirstTextVisible,
                                      ),
                                      reusableVisibility(
                                        reusableCategoryTextBtn(
                                            context,
                                            '${type['urdu'].toString().capitalize}',
                                            colorController.urduTextBtnColor),
                                        Provider.of<TextVisibilityProvider>(
                                                context)
                                            .isThirdTextVisible,
                                      ),
                                      reusableVisibility(
                                        reusableCategoryTextBtn(
                                            context,
                                            '${type['turkish'].toString().capitalize}',
                                            colorController
                                                .turkishTextBtnColor),
                                        Provider.of<TextVisibilityProvider>(
                                                context)
                                            .isForTextVisible,
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