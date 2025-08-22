import 'dart:convert';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:picture_dictionary/common/MySharedPrefrence.dart';
import 'package:picture_dictionary/common/provider.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/repo/category_repo.dart';
import 'package:picture_dictionary/res/re_text.dart';
import 'package:picture_dictionary/res/reusableAnimation.dart';
import 'package:picture_dictionary/res/reusableVisibility.dart';
import 'package:picture_dictionary/res/reusableloading.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

// class MatchWordGameTwo extends StatefulWidget {
//   final String selectedCategory;
//   final Future<List<Map<String, dynamic>>> itemsFuture;
//   final Future<Map<String, dynamic>> itemsFuture2;
//   const MatchWordGameTwo({Key? key,required this.selectedCategory, required this.itemsFuture,
//   required this.itemsFuture2
//   }) : super(key: key);

//   @override
//   State<MatchWordGameTwo> createState() => _MatchWordGameTwoState();
// }

// class _MatchWordGameTwoState extends State<MatchWordGameTwo> {
//   Future<Map<String, dynamic>> fetchGameCategories2() async {
//     try {
//       final response = await http.post(
//         Uri.parse('${PictureRepo.baseUrl}apis/get_limited_items_game5.php'),
//         body: {
//           'type_id': selectedCategory.toString(),
//         },
//       );

//       if (response.statusCode == 200) {
//         dynamic jsonResponse = jsonDecode(response.body);
//         Map<String, dynamic> itemsMap = {
//           'items': [],
//           'repeatedItems': [],
//         };

//         for (var category in jsonResponse) {
//           // if (category['type_id'] == categoryId) {
//           itemsMap['items'].addAll(category['items']);
//           if (category.containsKey('repeateditems')) {
//             itemsMap['repeatedItems'].addAll(category['repeateditems']);
//           }
//           break;
//           // }
//         }

//         print('Game All Items $itemsMap');
//         return itemsMap;
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       print('Error: $e');
//       throw Exception('Failed to load data');
//     }
//   }

//   late Future<Map<String, dynamic>> itemsFuture2;
//   List<String> selectedWords = []; // To keep track of selected words

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   PictureRepo pictureRepo = PictureRepo();
//   List<dynamic> item = [];

//   late int id;
//   // String? receivedCountValue;
//   // int unlockedCategoryIndex = -1;
//   String selectedCategory = '';
//   late Future<List<String>> categoriesFuture;
//   late Future<List<Map<String, dynamic>>> itemsFuture;
//   String cat_id = '';
//   late int userid;

//   int isLogin() {
//     final auth = FirebaseAuth.instance;
//     final user = auth.currentUser;

//     if (user != null) {
//       // userid = user.uid.toString();
//       setState(() {});
//       // MySharedPrefrence().set_user_id(user.uid);
//       // print('User Id ${MySharedPrefrence().get_user_id()}');
//       setState(() {});
//       return MySharedPrefrence().get_user_id();
//     } else {
//       userid = randomNumber;
//       print('Shayan    $userid');
//       MySharedPrefrence().set_user_id(userid);
//       return MySharedPrefrence().get_user_id();
//     }
//   }

//   late Random random;
//   late int randomNumber;

//   @override
//   void initState() {
//     random = Random();
//     randomNumber = random.nextInt(100000);
//     super.initState();
//     categoriesFuture = pictureRepo.fetchCategories();
//     // itemsFuture = fetchGameCategories(selectedCategory);
//     itemsFuture2 = fetchGameCategories2();
//   }

//     Future<void> refreshGameCategories() async {
//     setState(() {
//       itemsFuture2 = fetchGameCategories2();
//       selectedWords.clear();
//     });
//   }

//   int unlockedIndex = 0;

//   String? countValue = "0";
  // @override
  // Widget build(BuildContext context) {
  //   return WillPopScope(
  //     onWillPop: () async {
  //       return true;
  //     },
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: Text("MATCH WORD"),
  //         backgroundColor: Color(0xFFffb64d),
  //         automaticallyImplyLeading: false,
  //       ),
  //       body: Container(
  //         decoration: BoxDecoration(
  //           gradient: LinearGradient(
  //             begin: Alignment.topCenter,
  //             end: Alignment.bottomCenter,
  //             colors: [
  //               // eb8815 f5d12d
  //               colorController.bgColorup,
  //               colorController.bgColordown,
  //             ],
  //           ),
  //         ),
  //         width: MediaQuery.of(context).size.width,
  //         height: MediaQuery.of(context).size.height * 1,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             SizedBox(
  //               height: MediaQuery.of(context).size.height * .02,
  //             ),
  //             Expanded(
  //                 child: FutureBuilder<Map<String, dynamic>>(
  //                     future: itemsFuture2,
  //                     builder: (context, snapshot) {
  //                       if (snapshot.connectionState ==
  //                           ConnectionState.waiting) {
  //                         return Center(
  //                             child: reusableloadingrow(context, true));
  //                       } else if (snapshot.hasError) {
  //                         return Center(child: Image.asset('assets/no_net.png',fit: BoxFit.cover, filterQuality: FilterQuality.high,));
  //                       } else {
  //                         Map<String, dynamic> itemsMap = snapshot.data!;
  //                         List<dynamic> items = itemsMap['items'];
  //                         List<dynamic> word_break_options =
  //                             items[0]['word_break_options'];
  //                         String imageName = items[0]['english'];
  //                         print(imageName);

  //                         return SingleChildScrollView(
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.center,
  //                             children: [
  //                               Container(
  //                                 height:
  //                                     MediaQuery.of(context).size.height * .25,
  //                                 width: MediaQuery.of(context).size.width * .7,
  //                                 decoration: BoxDecoration(
  //                                   color: colorController.whiteColor,
  //                                   borderRadius: BorderRadius.circular(13),
  //                                 ),
  //                                 child: Center(
  //                                   child: Image.network(
  //                                     items[0]['image'],
  //                                     fit: BoxFit.cover,
  //                                     errorBuilder:
  //                                         (context, error, stackTrace) {
  //                                       return Image.asset(
  //                                           'assets/placeholder_not_found.png');
  //                                     },
  //                                   ),
  //                                 ),
  //                               ),
  //                               SizedBox(
  //                                 height:
  //                                     MediaQuery.of(context).size.height * .04,
  //                               ),
  //                               SingleChildScrollView(
  //                                 scrollDirection: Axis.horizontal,
  //                                 child: Row(
  //                                   mainAxisAlignment: MainAxisAlignment.center,
  //                                   children:
  //                                       word_break_options.map<Widget>((word) {
  //                                     bool isSelected =
  //                                         selectedWords.contains(word);
  //                                     return GestureDetector(
  //                                       onTap: () {
  //                                         setState(() {
  //                                           if (isSelected) {
  //                                             // Deselect the word
  //                                             selectedWords.remove(word);
  //                                           } else {
  //                                             // Select the word
  //                                             selectedWords.add(word);
  //                                           }
  //                                           print(selectedWords);
  //                                         });
  //                                       },
  //                                       child: Container(
  //                                         margin: EdgeInsets.symmetric(
  //                                             horizontal:
  //                                                 8.0), // Add some spacing
  //                                         padding: EdgeInsets.all(
  //                                             MediaQuery.sizeOf(context).width *
  //                                                 0.035),
  //                                         decoration: BoxDecoration(
  //                                           // color: selectedContainerIndex == index ? Colors.green : colorController.whiteColor,
  //                                           color: colorController.whiteColor,
  //                                           borderRadius:
  //                                               BorderRadius.circular(10),
  //                                           border: Border.all(
  //                                             color: isSelected
  //                                                 ? Colors.green
  //                                                 : colorController.whiteColor,
  //                                             width: 3,
  //                                           ),
  //                                         ),
  //                                         child: Center(
  //                                             child: reusabletext(
  //                                                 word,
  //                                                 colorController.blackColor,
  //                                                 18)),
  //                                       ),
  //                                     );
  //                                   }).toList(),
  //                                 ),
  //                               ),

  //                               SizedBox(
  //                                   height: MediaQuery.of(context).size.height *
  //                                       .02),

  //                               // Displaying the concatenated selected words below the word options
  //                               Text(
  //                                 selectedWords.join(
  //                                     ''), // Join selected words with spaces
  //                                 style: TextStyle(
  //                                   fontSize: 18,
  //                                   color: Colors.black,
  //                                   fontWeight: FontWeight.bold,
  //                                 ),
  //                               ),

  //                               InkWell(
  //                                 onTap: () {
  //                                    // Compare the concatenated selected words with the imageName
  //                                       String selectedWordString = selectedWords.join('').trim().toString();
  //                                       print(selectedWordString);
  //                                   if (selectedWordString.toLowerCase() == imageName.toLowerCase()) {
  //                                         print("Word is match"); // Match case
  //                                         showDialog(context: context, builder: (context) {
  //                                           return Container(child: Lottie.asset('assets/congrats.json'),);
  //                                         },);
  //                                         setState(() {refreshGameCategories();});
  //                                         Future.delayed(Duration(seconds: 1),() => Navigator.pop(context),);
  //                                       } else {
  //                                         print("Word is not match"); // No match case
  //                                         showDialog(context: context, builder: (context) {
  //                                           return Container(child: Lottie.asset('assets/failed.json'),);
  //                                         },);
  //                                         setState(() {refreshGameCategories();});
  //                                         Future.delayed(Duration(seconds: 1),() => Navigator.pop(context),);
  //                                       }
  //                                 },
  //                                 child: Container(
  //                                     height:
  //                                         MediaQuery.of(context).size.height *
  //                                             .19,
  //                                     width: MediaQuery.of(context).size.width *
  //                                         .8,
  //                                     decoration: BoxDecoration(
  //                                         image: DecorationImage(
  //                                       image: AssetImage('assets/et_bg.png'),
  //                                       filterQuality: FilterQuality.high,
  //                                       fit: BoxFit.contain,
  //                                     )),
  //                                     child: Center(
  //                                         child: Row(
  //                                             mainAxisAlignment:
  //                                                 MainAxisAlignment.center,
  //                                             children: [
  //                                           reusabletext(
  //                                               'SUBMIT',
  //                                               colorController.whiteColor,
  //                                               24.0),
  //                                         ]))),
  //                               ),
  //                             ],
  //                           ),
  //                         );
  //                       }
  //                     }
  //                     )
  //                     )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
// //   @override
// //   Widget build(BuildContext context) {
// //     // List<String> categories = item.map((e) => e['english'] as String).toList();
// //     return Scaffold(
// //         key: _scaffoldKey,
// //         // backgroundColor: Color(0xFFffb64d),
// //         appBar: reusableappbar(context, () {
// //           _scaffoldKey.currentState!.openDrawer();
// //         }, "CATEGORIES"),
// //         drawer: SideBar(),
// //         body: Stack(
// //           children: [
// //             Container(
// //               decoration: BoxDecoration(
// //                 gradient: LinearGradient(
// //                   begin: Alignment.topCenter,
// //                   end: Alignment.bottomCenter,
// //                   colors: [
// //                     // eb8815 f5d12d
// //                     colorController.bgColorup,
// //                     colorController.bgColordown,
// //                   ],
// //                 ),
// //               ),
// //               width: MediaQuery.of(context).size.width,
// //               height: MediaQuery.of(context).size.height,
// //               child: Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Consumer<TextVisibilityProvider>(builder: (context, textVisibilityProvider, child) {
// //                     return FutureBuilder(
// //                     future: pictureRepo.fetchData(),
// //                     builder: (context, snapshot) {
// //                       if (snapshot.connectionState == ConnectionState.waiting) {
// //                         return Center(child: reusableloadingrow(context, true));
// //                       } else if (!snapshot.hasData) {
// //                         return
// //                         Center(child: Text('No Data Found'));
// //                       } else {
// //                         List<Map<String, dynamic>> data = snapshot.data!;
// //                         return GridView.builder(
// //                           gridDelegate:
// //                               SliverGridDelegateWithFixedCrossAxisCount(
// //                             crossAxisCount: 2,
// //                             crossAxisSpacing: 10,
// //                             mainAxisSpacing: 10,
// //                           ),
// //                           // itemCount: isLogin()
// //                           //     ? data.length
// //                           //     : 3, // Show all items if logged in, else show only 3
// //                           itemCount: data.length > 5 ? data.length - 2 : 0,
// //                           // item.length > 5 ? item.length - 2 : 0,
// //                           itemBuilder: (context, index) {
// //   Map<String, dynamic> type = data[index];

// //   // Determine if the current index should be locked
// //   bool isLocked = index > unlockedIndex;

// //   return GestureDetector(
// //     onTap: () {
// //       if (!isLocked) {
// //         String voiceUrl;
// //         if (textVisibilityProvider.isFirstTextVisible) {
// //           voiceUrl = '${type['arabic_voice']}';
// //         } else if (textVisibilityProvider.isThirdTextVisible) {
// //           voiceUrl = '${type['urdu_voice']}';
// //         } else if (textVisibilityProvider.isForTextVisible) {
// //           voiceUrl = '${type['turkish_voice']}';
// //         }else if (textVisibilityProvider.isFiveTextVisible) {
// //           voiceUrl = '${type['chinese_voice']}';
// //         } else if (textVisibilityProvider.isSixTextVisible) {
// //           voiceUrl = '${type['pashto_voice']}';
// //         } else {
// //           voiceUrl = '${type['english_voice']}';
// //         }

// //         pictureRepo.playAudioFromUrl(voiceUrl);

// //         setState(() async {
// //           selectedCategory = type['id'];
// //           itemsFuture = fetchGameCategories(selectedCategory);
// //           itemsFuture2 = fetchGameCategories2(selectedCategory);

// //              final result = await Navigator.push(
// //               context,
// //               MaterialPageRoute(builder: (context) => MatchWordGameTwo(
// //                 itemsFuture: itemsFuture,
// //                 selectedCategory: selectedCategory,
// //                 itemsFuture2: itemsFuture2,)),
// //             );
// //             setState(() {});
// //             if (result != null) {
// //               setState(() {
// //                 countValue = result;
// //               });
// //             }
// //           // Navigator.push(
// //           //   context,
// //           //   MaterialPageRoute(
// //           //     builder: (context) => GamePageThree(
// //           //       itemsFuture: itemsFuture,
// //           //       selectedCategory: selectedCategory,
// //           //       itemsFuture2: itemsFuture2,
// //           //     ),
// //           //   ),
// //           // );

// //           // If the countValue condition is met, unlock the next index
// //           if (index == unlockedIndex && int.parse(countValue!) >= 6) {
// //             unlockedIndex++;
// //           }
// //         });
// //       }
// //     },
// //     child: Container(
// //       decoration: BoxDecoration(
// //         color: colorController.whiteColor,
// //         borderRadius: BorderRadius.circular(10),
// //       ),
// //       padding: EdgeInsets.all(10),
// //       child: Container(
// //         width: MediaQuery.of(context).size.width * .44,
// //         decoration: BoxDecoration(
// //           color: colorController.whiteColor,
// //           borderRadius: BorderRadius.circular(11),
// //         ),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           children: [
// //             Expanded(
// //               child: CachedNetworkImage(
// //                 imageUrl: isLocked ? 'assets/a.png' : type['image'],
// //                 errorWidget: (context, url, error) => Image.asset(
// //                   isLocked ? 'assets/a.png' : 'assets/placeholder_not_found.png',
// //                 ),
// //                 width: double.infinity,
// //                 fit: BoxFit.contain,
// //                 filterQuality: FilterQuality.high,
// //                 placeholder: (context, url) => Image.asset(
// //                   'assets/placeholder_loading.png',
// //                 ),
// //               ),
// //             ),
// //             reusableCategoryTextBtn(
// //               context,
// //               '${type['english'].toString().capitalize}',
// //               colorController.categoryBtnColor,'English1'
// //             ),
// //             reusableVisibility(
// //               reusableCategoryTextBtn(
// //                                             context,
// //                                             '${type['arabic'].toString().capitalize}',
// //                                             colorController.arabicTextBtnColor,
// //                                             'arabicfont',
// //                                             ),
// //               Provider.of<TextVisibilityProvider>(context).isFirstTextVisible,
// //             ),
// //             reusableVisibility(
// //               reusableCategoryTextBtn(
// //                 context,
// //                 '${type['urdu'].toString().capitalize}',
// //                 colorController.urduTextBtnColor,'urdu2'
// //               ),
// //               Provider.of<TextVisibilityProvider>(context).isThirdTextVisible,
// //             ),
// //             reusableVisibility(
// //               reusableCategoryTextBtn(
// //                 context,
// //                 '${type['turkish'].toString().capitalize}',
// //                 colorController.turkishTextBtnColor,''
// //               ),
// //               Provider.of<TextVisibilityProvider>(context).isForTextVisible,
// //             ),

// //             reusableVisibility(
// //               reusableCategoryTextBtn(
// //                 context,
// //                 '${type['chinese'].toString().capitalize}',
// //                 colorController.chineseTextBtnColor,''
// //               ),
// //               Provider.of<TextVisibilityProvider>(context).isFiveTextVisible,
// //             ),
// //             reusableVisibility(
// //               reusableCategoryTextBtn(
// //                 context,
// //                 '${type['pashto'].toString().capitalize}',
// //                 colorController.pashtoTextBtnColor,''
// //               ),
// //               Provider.of<TextVisibilityProvider>(context).isSixTextVisible,
// //             ),
// //           ],
// //         ),
// //       ),
// //     ),
// //   );
// // },
// //                         );
// //                       }
// //                     },
// //                   );
// //                   },)
// //                   ),
// //             ),
// //             if (pictureRepo.isLoading == true)
// //               reusableloadingrow(context, pictureRepo.isLoading),
// //             reusableloadingrow(context, pictureRepo.isLoading)
// //           ],
// //         ));
// //   }
// }

class MatchWordGameTwo extends StatefulWidget {
  final String selectedCategory;
  final Future<List<Map<String, dynamic>>> itemsFuture;
  final Future<Map<String, dynamic>> itemsFuture2;
  const MatchWordGameTwo({Key? key,required this.selectedCategory, required this.itemsFuture,
  required this.itemsFuture2
  }) : super(key: key);

  @override
  State<MatchWordGameTwo> createState() => _MatchWordGameTwoState();
}

class _MatchWordGameTwoState extends State<MatchWordGameTwo> {
  late Future<List<Map<String, dynamic>>> _itemsFuture;
  late Future<Map<String, dynamic>> _itemsFuture2;
   String countValue = '0';
     late Random random;
  late int randomNumber;

  @override
  void initState() {
    super.initState();
    random = Random();
    randomNumber = random.nextInt(100000);
    _itemsFuture = widget.itemsFuture;
    _itemsFuture2 = widget.itemsFuture2;
    items = widget.itemsFuture2;
    repeatedItems = widget.itemsFuture2;
    questionID;
    isLogin();
     getSelectedIndex().then((index) {
    if (index != -1) {
      setState(() {
        selectedContainerIndex = index;
      });
    }
  });
    // _btnItemsFuture = widget.btnItemsFuture;
  }

  //   @override
//   void initState() {
//     random = Random();
//     randomNumber = random.nextInt(100000);
//     super.initState();
//     categoriesFuture = pictureRepo.fetchCategories();
//     // itemsFuture = fetchGameCategories(selectedCategory);
//     itemsFuture2 = fetchGameCategories2();
//   }

    Future<void> refreshGameCategories() async {
    setState(() {
      itemsFuture2 = fetchGameCategories2(selectedCategory.toString());
      selectedWords.clear();
    });
  }
  late int userid;
  String selectedCategory = '';

  int isLogin() {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    
    if (MySharedPrefrence().get_user_id() != 0) {
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

  Future<Map<String, dynamic>> questionApi()async{
    final response = await http.post(
      Uri.parse('${PictureRepo.baseUrl}apis/match_word_add_question_answers_status.php'),
      body: {
        'user_id': MySharedPrefrence().get_user_id().toString(),
        'type_id': widget.selectedCategory.toString(),
        'item_id_question': questionID.toString(),
        'item_id_answer' : answerID.toString()
        // MySharedPrefrence().get_cat_id(),
      },
      
    );
    var data;
    if(response.statusCode == 200){
       data = jsonDecode(response.body.toString());
       setState(() {});
      print('Question Api Response : ${data}');
     print('User Id ${MySharedPrefrence().get_user_id()}');
      return data;
    }
    return data;
   }

   Future<Map<String, dynamic>> CountApi() async {
  final response = await http.post(
    Uri.parse('${PictureRepo.baseUrl}apis/match_word_count_question_answers.php'),
    body: {
      'user_id': MySharedPrefrence().get_user_id().toString(),
      'type_id': widget.selectedCategory.toString(),
    },
  );
  if (response.statusCode == 200) {
    try {
      var data = jsonDecode(response.body.toString());
      setState(() {
        // Update the global variable with the count value
        // countValue = int.parse(data['count']);
        countValue = data['count'];
      });
      print('Count Api Response : $data');
      print('User Id ${MySharedPrefrence().get_user_id()}');
      return data;
    } catch (e) {
      print('Error parsing JSON: $e');
      throw Exception('Error $e');
    }
  } else {
    print('HTTP error ${response.statusCode}: ${response.reasonPhrase}');
    throw Exception('HTTP error ${response.statusCode}: ${response.reasonPhrase}');
  }

}


  late Future<Map<String, dynamic>> itemsFuture2;
  List<String> selectedWords = []; // To keep track of selected words

  late Future<Map<String,dynamic>> items;
  late Future<Map<String,dynamic>> repeatedItems;
  String questionID = '';
  String answerID = '';

         int selectedContainerIndex = -1;
         // Function to save the selected index in SharedPreferences
void saveSelectedIndex(int index) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('selected_index', index);
}

// Function to get the selected index from SharedPreferences
Future<int> getSelectedIndex() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('selected_index') ?? -1; // Return -1 if the index is not found
}

int count = 1;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
         onWillPop: () async {
           final response = await http.post(
      Uri.parse('${PictureRepo.baseUrl}apis/clear_match_word_results.php'),
      body: {
        'user_id': MySharedPrefrence().get_user_id().toString(),
      },
    );
    var data;
    if(response.statusCode == 200){
       data = jsonDecode(response.body.toString());
      print('Clear Data Api Response : ${data}');
      return true;
    }
    Navigator.pop(context, countValue);
        return true;
        
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Play"),backgroundColor: Color(0xFFffb64d),automaticallyImplyLeading: false,),
        body: Container(
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
                height: MediaQuery.of(context).size.height *1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reusabletext('Quiz # $count', colorController.blackColor, 22),
                    reusabletext('Score: $countValue/10', colorController.blackColor, 22)
                  ],
                ),
              ),
                SizedBox(height: MediaQuery.of(context).size.height * .02,),
              Expanded(
                child: FutureBuilder<Map<String, dynamic>>(
                      future: _itemsFuture2,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: reusableloadingrow(context, true));
                        } else if (snapshot.hasError) {
                          return Center(child: Image.asset('assets/no_net.png',fit: BoxFit.cover, filterQuality: FilterQuality.high,));
                        } else {
                          Map<String, dynamic> itemsMap = snapshot.data!;
                          List<dynamic> items = itemsMap['items'];
                          List<dynamic> word_break_options =
                              items[0]['word_break_options'];
                          String imageName = items[0]['english'];
                          print('Items length: ${items.length}');
                          print('First item: ${items[0]}');
                          print(imageName);
                          questionID = imageName;
                          print('word $word_break_options');

                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .25,
                                  width: MediaQuery.of(context).size.width * .7,
                                  decoration: BoxDecoration(
                                    color: colorController.whiteColor,
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: Center(
                                    child: Image.network(
                                      items[0]['image'],
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                            'assets/placeholder_not_found.png');
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .04,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                        word_break_options.map<Widget>((word) {
                                      bool isSelected =
                                          selectedWords.contains(word);
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isSelected) {
                                              // Deselect the word
                                              selectedWords.remove(word);
                                            } else {
                                              // Select the word
                                              selectedWords.add(word);
                                            }
                                            print(selectedWords);
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal:
                                                  8.0), // Add some spacing
                                          padding: EdgeInsets.all(
                                              MediaQuery.sizeOf(context).width *
                                                  0.035),
                                          decoration: BoxDecoration(
                                            // color: selectedContainerIndex == index ? Colors.green : colorController.whiteColor,
                                            color: colorController.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: isSelected
                                                  ? Colors.green
                                                  : colorController.whiteColor,
                                              width: 3,
                                            ),
                                          ),
                                          child: Center(
                                              child: reusabletext(
                                                  word,
                                                  colorController.blackColor,
                                                  18)),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),

                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .02),

                                // Displaying the concatenated selected words below the word options
                                Text(
                                  selectedWords.join(
                                      ''), // Join selected words with spaces
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                     // Compare the concatenated selected words with the imageName
                                    //     String selectedWordString = selectedWords.join('').trim().toString();
                                    //     print(selectedWordString);
                                    // if (selectedWordString.toLowerCase() == imageName.toLowerCase()) {
                                    //       print("Word is match"); // Match case
                                    //       showDialog(context: context, builder: (context) {
                                    //         return Container(child: Lottie.asset('assets/congrats.json'),);
                                    //       },);
                                    //       setState(() {refreshGameCategories();});
                                    //       Future.delayed(Duration(seconds: 1),() => Navigator.pop(context),);
                                    //     } else {
                                    //       print("Word is not match"); // No match case
                                    //       showDialog(context: context, builder: (context) {
                                    //         return Container(child: Lottie.asset('assets/failed.json'),);
                                    //       },);
                                    //       setState(() {refreshGameCategories();});
                                    //       Future.delayed(Duration(seconds: 1),() => Navigator.pop(context),);
                                    //     }
                                    answerID = selectedWords.join('');
                                    print('question $questionID');
                                    print('answer $answerID');
                          questionApi();
                          CountApi();
                          _refreshItems();
                          selectedContainerIndex = -1;
                          print('Count value every click $countValue');
                          if(count == 10){
                            count = 0;
                            setState(() {
                              if(int.parse(countValue.toString()) >= int.parse('6')){
                                reusableAnimationWin(context, 'assets/win.png', 'Next',countValue);
                              }else{
                                reusableAnimation(context, 'assets/failed.json', 'Try Again',countValue);
                              }
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => GamePageTwo(),));
                            });
                          }else{
                            setState(() {
                              count++;
                            });
                          }
    selectedWords.clear();        // Clear old selections
                                  },
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .19,
                                      width: MediaQuery.of(context).size.width *
                                          .8,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage('assets/et_bg.png'),
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.contain,
                                      )),
                                      child: Center(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                            reusabletext(
                                                'SUBMIT',
                                                colorController.whiteColor,
                                                24.0),
                                          ]))),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                      )
        )
            ],
          ),
        ),
      ),
    );
  }
  void _refreshItems(){
    setState(() {
      _itemsFuture2 =  fetchGameCategories2(widget.selectedCategory);
    });
  }



  Future<Map<String, dynamic>> fetchGameCategories(String categoryId) async {
    try {
      final response = await http.post(
        Uri.parse('${PictureRepo.baseUrl}apis/get_limited_items_game5.php'),
        body: {
          'type_id': categoryId.toString(),
        },
      );

      if (response.statusCode == 200) {
        dynamic jsonResponse = jsonDecode(response.body);
        Map<String, dynamic> itemsMap = {
          'items': [],
          'repeatedItems': [],
        };

        for (var category in jsonResponse) {
          // if (category['type_id'] == categoryId) {
          itemsMap['items'].addAll(category['items']);
          if (category.containsKey('repeateditems')) {
            itemsMap['repeatedItems'].addAll(category['repeateditems']);
          }
          break;
          // }
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


  Future<Map<String, dynamic>> fetchGameCategories2(String categoryId) async {
    try {
      final response = await http.post(
        Uri.parse('${PictureRepo.baseUrl}apis/get_limited_items_game5.php'),
        body: {
          'type_id': categoryId.toString(),
        },
      );

      if (response.statusCode == 200) {
        dynamic jsonResponse = jsonDecode(response.body);
        Map<String, dynamic> itemsMap = {
          'items': [],
          'repeatedItems': [],
        };

        for (var category in jsonResponse) {
          // if (category['type_id'] == categoryId) {
          itemsMap['items'].addAll(category['items']);
          if (category.containsKey('repeateditems')) {
            itemsMap['repeatedItems'].addAll(category['repeateditems']);
          }
          break;
          // }
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
}