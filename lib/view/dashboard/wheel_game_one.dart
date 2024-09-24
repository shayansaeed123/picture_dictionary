

import 'dart:convert';
import 'dart:math';

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
import 'package:picture_dictionary/view/dashboard/voice_game_two.dart';
import 'package:picture_dictionary/view/dashboard/wheel_game_two.dart';
import 'package:picture_dictionary/widget/sidebar.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class wheelgameone extends StatefulWidget {
  const wheelgameone({super.key});

  @override
  State<wheelgameone> createState() => _wheelgameoneState();
}

class _wheelgameoneState extends State<wheelgameone> {

  Future<Map<String, dynamic>> fetchGameCategories2(String categoryId) async {
  try {
    final response = await http.post(
      Uri.parse('${PictureRepo.baseUrl}public/vocgame/apis/get_limited_items.php'),
      body: {
        'type_id': selectedCategory.toString(),
      },
    );

    if (response.statusCode == 200) {
      dynamic jsonResponse = jsonDecode(response.body);
      Map<String, dynamic> itemsMap = {
        'items': [],
        'repeatedItems': [],
      };

      for (var category in jsonResponse) {
        if (category['type_id'] == categoryId) {
          itemsMap['items'].addAll(category['items']);
          if (category.containsKey('repeateditems')) {
            itemsMap['repeatedItems'].addAll(category['repeateditems']);
          }
          break;
        }
      }

      print('Game All Items $itemsMap');
      return itemsMap;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e');
    throw Exception('Failed to load data');
  }
}

late Future<Map<String, dynamic>> itemsFuture2;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PictureRepo pictureRepo = PictureRepo();
  List<dynamic> item = [];

  late int id;
  // String? receivedCountValue;
  // int unlockedCategoryIndex = -1;
  String selectedCategory = '';
  late Future<List<String>> categoriesFuture;
  late Future<List<Map<String, dynamic>>> itemsFuture;
  String cat_id = '';
  late int userid;

  int isLogin() {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    
    if (user != null) {
      // userid = user.uid.toString();
      setState(() {
        
      });
      // MySharedPrefrence().set_user_id(user.uid);
      // print('User Id ${MySharedPrefrence().get_user_id()}');
      setState(() {
        
      });
      return MySharedPrefrence().get_user_id();
    }else{
      userid = randomNumber;
      print('Shayan    $userid');
      MySharedPrefrence().set_user_id(userid);
    return MySharedPrefrence().get_user_id();
    }
    
  }

  Future<Map<String, dynamic>> clearData()async{
    final response = await http.post(
      Uri.parse('${PictureRepo.baseUrl}public/vocgame/apis/clear_result.php'),
      body: {
        'user_id': MySharedPrefrence().get_user_id().toString(),
      },
    );
    var data;
    if(response.statusCode == 200){
       data = jsonDecode(response.body.toString());
      print('Clear Data Api Response : ${data}');
      return data;
    }
    return data;
   }
Future<List<Map<String, dynamic>>> fetchGameCategories(String categoryId,) async {
  try {
    // _isLoading = false;
    // print('myshared ${MySharedPrefrence().get_cat_id()}');
    final response = await http.post(
      Uri.parse('${PictureRepo.baseUrl}public/vocgame/apis/get_limited_items.php'),
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
      for (var category in jsonResponse) {
        if (category['type_id'] == categoryId) {
          items.addAll(category['items'].cast<Map<String, dynamic>>());
          // Check if repeated items exist and add them
          if (category.containsKey('repeateditems')) {
            items.addAll(category['repeateditems'].cast<Map<String, dynamic>>());
          }
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


  late Random random;
  late int randomNumber;

  @override
  void initState() {
    random = Random();
    randomNumber = random.nextInt(100000);
    super.initState();
    categoriesFuture = pictureRepo.fetchCategories();
    itemsFuture = fetchGameCategories(selectedCategory);
    itemsFuture2 =  fetchGameCategories2(selectedCategory);
    clearData();
    
  }
int unlockedIndex = 0; 
// String receivedCountValue = "7";

 String? countValue = "0";
  @override
  Widget build(BuildContext context) {
    // List<String> categories = item.map((e) => e['english'] as String).toList();
    return Scaffold(
        key: _scaffoldKey,
        // backgroundColor: Color(0xFFffb64d),
        appBar: reusableappbar(context, () {
          _scaffoldKey.currentState!.openDrawer();
        }, "CATEGORIES"),
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
                    
                          itemCount: data.length > 5 ? data.length - 2 : 0,
                      
                          itemBuilder: (context, index) {
  Map<String, dynamic> type = data[index];
  bool isLocked = index > unlockedIndex;

  return GestureDetector(
    onTap: () {
      if (!isLocked) {
        String voiceUrl;
        if (textVisibilityProvider.isFirstTextVisible) {
          voiceUrl = '${type['arabic_voice']}';
        } else if (textVisibilityProvider.isThirdTextVisible) {
          voiceUrl = '${type['urdu_voice']}';
        } else if (textVisibilityProvider.isForTextVisible) {
          voiceUrl = '${type['turkish_voice']}';
        } else {
          voiceUrl = '${type['english_voice']}';
        }

        pictureRepo.playAudioFromUrl(voiceUrl);

        setState(() async {
          selectedCategory = type['id'];
          itemsFuture = fetchGameCategories(selectedCategory);
          itemsFuture2 = fetchGameCategories2(selectedCategory);

             final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => wheelgametwo( 
                itemsFuture: itemsFuture,
                selectedCategory: selectedCategory,
                itemsFuture2: itemsFuture2,)),
            );
            setState(() {});
            if (result != null) {
              setState(() {
                countValue = result;
              });
            }
         
          if (index == unlockedIndex && int.parse(countValue!) >= 6) {
            unlockedIndex++;
          }
        });
      }
    },
    child: Container(
      decoration: BoxDecoration(
        color: colorController.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width * .44,
        decoration: BoxDecoration(
          color: colorController.whiteColor,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: isLocked ? 'assets/a.png' : type['image'],
                errorWidget: (context, url, error) => Image.asset(
                  isLocked ? 'assets/a.png' : 'assets/placeholder_not_found.png',
                ),
                width: double.infinity,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
                placeholder: (context, url) => Image.asset(
                  'assets/placeholder_loading.png',
                ),
              ),
            ),
            reusableCategoryTextBtn(
              context,
              '${type['english'].toString().capitalize}',
              colorController.categoryBtnColor,
              'English1',
            ),
            reusableVisibility(
              reusableCategoryTextBtn(
                context,
                '${type['arabic'].toString().capitalize}',
                colorController.arabicTextBtnColor,
                'arabicfont',
              ),
              Provider.of<TextVisibilityProvider>(context).isFirstTextVisible,
            ),
            reusableVisibility(
              reusableCategoryTextBtn(
                context,
                '${type['urdu'].toString().capitalize}',
                colorController.urduTextBtnColor,
                'urdu2',
              ),
              Provider.of<TextVisibilityProvider>(context).isThirdTextVisible,
            ),
            reusableVisibility(
              reusableCategoryTextBtn(
                context,
                '${type['turkish'].toString().capitalize}',
                colorController.turkishTextBtnColor,
                '',
              ),
              Provider.of<TextVisibilityProvider>(context).isForTextVisible,
            ),
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