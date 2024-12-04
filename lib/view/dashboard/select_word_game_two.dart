import 'dart:convert';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:picture_dictionary/common/MySharedPrefrence.dart';
import 'package:picture_dictionary/common/provider.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/repo/category_repo.dart';
import 'package:picture_dictionary/res/re_text.dart';
import 'package:picture_dictionary/res/reusableAnimation.dart';
import 'package:picture_dictionary/res/reusableVisibility.dart';
import 'package:picture_dictionary/res/reusableloading.dart';
import 'package:http/http.dart' as http;
import 'package:picture_dictionary/res/reusableloginbtn.dart';
import 'package:picture_dictionary/view/dashboard/game_page_two.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../res/audioplayer.dart';

class SelectWordGameTwo extends StatefulWidget {
  final String selectedCategory;
  final Future<List<Map<String, dynamic>>> itemsFuture;
  final Future<Map<String, dynamic>> itemsFuture2;
  const SelectWordGameTwo({Key? key,required this.selectedCategory, required this.itemsFuture,
  required this.itemsFuture2
  }) : super(key: key);

  @override
  State<SelectWordGameTwo> createState() => _SelectWordGameTwoState();
}

class _SelectWordGameTwoState extends State<SelectWordGameTwo> {
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
  // late String userid;

  // String isLogin() {
  //   final auth = FirebaseAuth.instance;
  //   final user = auth.currentUser;
    
  //   if (user != null) {
  //     // userid = user.uid.toString();
  //     setState(() {
        
  //     });
  //     MySharedPrefrence().set_user_id(user.uid.toString());
  //     print('User Id ${MySharedPrefrence().get_user_id()}');
  //     setState(() {
        
  //     });
  //     return MySharedPrefrence().get_user_id();
  //   }else{
  //     userid = randomNumber.toString();
  //     print('Shayan    $userid');
  //     MySharedPrefrence().set_user_id(userid);
  //   return userid;
  //   }
    
  // }

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

  Future<Map<String, dynamic>> questionApi()async{
    final response = await http.post(
      Uri.parse('${PictureRepo.baseUrl}apis/add_words_answers_status.php'),
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
    Uri.parse('${PictureRepo.baseUrl}apis/count_word_answers.php'),
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


final AudioPlayer audioPlayer = AudioPlayer();
  Future<void> playAudioFromUrl(String url) async {
    await audioPlayer.play(UrlSource(url));
    if(url == 1){
      print('succes');
    }else{
      print('fail');
    }
  }

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
      Uri.parse('${PictureRepo.baseUrl}apis/clear_word_result.php'),
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
        appBar: AppBar(title: Text("Select Word Game"),backgroundColor: Color(0xFFffb64d),automaticallyImplyLeading: false,),
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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Expanded(
                child: FutureBuilder<Map<String, dynamic>>(future: _itemsFuture2,builder: (context, snapshot) {
                   if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: reusableloadingrow(context, true));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          Map<String, dynamic> itemsMap = snapshot.data!;
          List<dynamic> items = itemsMap['items'];
          List<dynamic> repeatedItems = itemsMap['repeatedItems'];
          print('question id $questionID');
          print('answer id $answerID');
          print('userId ${MySharedPrefrence().get_user_id()}');
          print('type_id ${widget.selectedCategory.toString()}');
      
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
             
              children: [
                 SizedBox(height: MediaQuery.of(context).size.height * .01,),
                   for (var item in repeatedItems)
                      InkWell(
                        onTap: (){
                          questionID = item['id'];
                          // questionApi();
                          // CountApi();
                          // _refreshItems();
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
                          
                        },
                         child: Column(
                          children: [
                            reusableVisibility(Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: AudioPlayerWidget(
                                          audioUrl: '${item['english_voice'].toString()}',
                                        ),
                         ), Provider.of<TextVisibilityProvider>(context).isSecondTextVisible),
                         reusableVisibility(Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: AudioPlayerWidget(
                                          audioUrl: '${item['arabic_voice'].toString()}',
                                        ),
                         ), Provider.of<TextVisibilityProvider>(context).isFirstTextVisible),
                         reusableVisibility(Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: AudioPlayerWidget(
                                          audioUrl: '${item['urdu_voice'].toString()}',
                                        ),
                         ), Provider.of<TextVisibilityProvider>(context).isThirdTextVisible),
                         reusableVisibility(Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: AudioPlayerWidget(
                                          audioUrl: '${item['turkish_voice'].toString()}',
                                        ),
                         ), Provider.of<TextVisibilityProvider>(context).isForTextVisible),
      
                         reusableVisibility(Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: AudioPlayerWidget(
                                          audioUrl: '${item['chinese_voice'].toString()}',
                                        ),
                         ), Provider.of<TextVisibilityProvider>(context).isFiveTextVisible),
                         reusableVisibility(Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: AudioPlayerWidget(
                                          audioUrl: '${item['pashto_voice'].toString()}',
                                        ),
                         ), Provider.of<TextVisibilityProvider>(context).isSixTextVisible),
      
      
                         reusableVisibility(Padding(
                           padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.13,vertical: MediaQuery.sizeOf(context).height * 0.011),
                           child: AudioPlayerWidget(
                                          audioUrl: '${item['english_voice'].toString()}',
                                        ),
                         ), Provider.of<TextVisibilityProvider>(context).englishbtn),
      
                         Container(
                          margin: EdgeInsets.all(MediaQuery.of(context).size.width * .02),
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width * .10),
                      width: MediaQuery.of(context).size.width * .6,
                      height: MediaQuery.of(context).size.height * .26,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        image: DecorationImage(
                          image: NetworkImage(item['image']),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fill,
                        ),
                      ),
                      // child: ,
                         ),
                          // Image.network(item['image'],errorBuilder: (context, error, stackTrace) {
                          //       return Image.asset('assets/placeholder_not_found.png');
                          //     },)
                          ],
                         )
                      ),
      
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  // height: MediaQuery.of(context).size.height * 0.4,
                  child: GridView(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.4,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                    ),
                  
                    children: [
                      // for (var item in items)
                      
                      for (int index = 0; index < items.length; index++)
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .02,),
                        //   child: 
                          InkWell(
                            onTap: (){
                              
                              setState(() {
                                selectedContainerIndex = index;
                                 
                              });
                              answerID = items[index]['id'];
                              saveSelectedIndex(index);
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * .45,
                              decoration: BoxDecoration(
                                // color: selectedContainerIndex == index ? Colors.green : colorController.whiteColor,
                                color: colorController.whiteColor,
                                borderRadius: BorderRadius.circular(13),
                                border: Border.all(
                          color:  selectedContainerIndex == index ? Colors.green : colorController.whiteColor,
                          width: 3,
                        ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                  
                              //     Image.network(items[index]['image'],errorBuilder: (context, error, stackTrace) {
                              //   return Image.asset('assets/placeholder_not_found.png');
                              // },)
                                  reusableVisibility(Center(child: Text(items[index]['english'],style: TextStyle(fontSize: 18),)), 
                                  Provider.of<TextVisibilityProvider>(context).englishbtn),
                                  reusableVisibility(Center(child: Text(items[index]['english'],style: TextStyle(fontSize: 18),)), 
                                  Provider.of<TextVisibilityProvider>(context).isSecondTextVisible),
                                  reusableVisibility(Center(child: Text(items[index]['arabic'],style: TextStyle(fontSize: 18),)), 
                                  Provider.of<TextVisibilityProvider>(context).isFirstTextVisible),
                                  reusableVisibility(Center(child: Text(items[index]['urdu'],style: TextStyle(fontSize: 18),)), 
                                  Provider.of<TextVisibilityProvider>(context).isThirdTextVisible),
                                  reusableVisibility(Center(child: Text(items[index]['turkish'],style: TextStyle(fontSize: 18),)), 
                                  Provider.of<TextVisibilityProvider>(context).isForTextVisible),
                  
                                  reusableVisibility(Center(child: Text(items[index]['chinese'],style: TextStyle(fontSize: 18),)), 
                                  Provider.of<TextVisibilityProvider>(context).isFiveTextVisible),
                                  reusableVisibility(Center(child: Text(items[index]['pashto'],style: TextStyle(fontSize: 18),)), 
                                  Provider.of<TextVisibilityProvider>(context).isSixTextVisible),
                                ],
                              )
                              ),
                          ),
                        // ),
                         ],
                     ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width * 0.8,
                //   height: MediaQuery.of(context).size.height * 0.3, // Adjust this height as needed
                //   child: GridView.builder(
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2,
                //       crossAxisSpacing: 10,
                //       mainAxisSpacing: 10,
                //     ),
                //     itemCount: items.length,
                //     shrinkWrap: true,
                //     physics: NeverScrollableScrollPhysics(),
                //     itemBuilder: (context, index) {
                //       return InkWell(
                //         onTap: () {
                //           setState(() {
                //             selectedContainerIndex = index;
                //           });
                //           answerID = items[index]['id'];
                //           saveSelectedIndex(index);
                //         },
                //         child: Container(
                //           // padding: EdgeInsets.all(1.0), // Add padding to avoid text being too close to the edges
                //           decoration: BoxDecoration(
                //                       border: Border.all(color: Colors.black), // Optional: for visibility
                //           ),
                //           child: Column(
                //                       mainAxisAlignment: MainAxisAlignment.center, // Center the text vertically
                //                       children: [
                //                         Expanded(
                //                           child: Center(
                //                             child: reusableVisibility(
                //                               Text(
                //         items[index]['english'],
                //         style: TextStyle(fontSize: 18, overflow: TextOverflow.visible), // Adjust text size
                //         textAlign: TextAlign.center, // Center the text
                //                               ),
                //                               Provider.of<TextVisibilityProvider>(context).englishbtn,
                //                             ),
                //                           ),
                //                         ),
                //                       ],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
      
                //  SizedBox(height: MediaQuery.of(context).size.height * .01,),
                   for (var item in repeatedItems)
                      InkWell(
                        onTap: (){
                          questionID = item['id'];
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
                          
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * .1,
                          width: MediaQuery.of(context).size.width * .8,
                          decoration: BoxDecoration(image: DecorationImage(
                            
                            image: AssetImage('assets/et_bg.png'),filterQuality: FilterQuality.high,fit: BoxFit.contain,)),
                          child: Center(child: 
                          
                          Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          reusabletext('SUBMIT', colorController.whiteColor, 24.0),
                          ]
                          )
                          // reusabletext('${item['english'].toString().capitalize}',colorController.whiteColor,22)
                          
                          )),
                      ),
                   
                  //  SizedBox(height: MediaQuery.of(context).size.height * .01,),
                  //  for (var item in repeatedItems)
                  //     InkWell(
                  //       onTap: (){
                  //         questionID = item['id'];
                  //         questionApi();
                  //         CountApi();
                  //         _refreshItems();
                  //         print('Count value every click $countValue');
                  //         if(count == 10){
                  //           count = 0;
                  //           setState(() {
                  //             if(int.parse(countValue.toString()) >= int.parse('6')){
                  //               reusableAnimation(context, 'assets/congrats.json', 'Next',countValue);
                  //             }else{
                  //               reusableAnimation(context, 'assets/failed.json', 'Try Again',countValue);
                  //             }
                  //             // Navigator.push(context, MaterialPageRoute(builder: (context) => GamePageTwo(),));
                  //           });
                  //         }else{
                  //           setState(() {
                  //             count++;
                  //           });
                  //         }
                          
                  //       },
                  //        child: AudioPlayerWidget(
                  //                       audioUrl: '${item['english_voice'].toString()}',
                  //                     ),
      
                        
                        // child: Container(
                        //   height: MediaQuery.of(context).size.height * .25,
                        //   width: MediaQuery.of(context).size.width * .8,
                        //   decoration: BoxDecoration(image: DecorationImage(
                            
                        //     image: AssetImage('assets/et_bg.png'),filterQuality: FilterQuality.high,fit: BoxFit.contain,)),
                        //   child: Center(child: 
                          
                        //   Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //       AudioPlayerWidget(
                        //                 audioUrl: '${item['english_voice'].toString()}',
                        //               ),
                        
                        //     //  playAudioFromUrl('${item['english'].toString()}'),
                        //   // reusabletext('${item['english'].toString().capitalize} ', colorController.whiteColor, 24.0), 
                        //                     SizedBox(height: 16.0),
                        //                     Row(children: [
                        //                       reusableVisibility(reusabletext('| ${item['arabic'].toString().capitalize}', colorController.whiteColor, 22.0), 
                        //                       Provider.of<TextVisibilityProvider>(context).isFirstTextVisible,),
                        //                       reusableVisibility(reusabletext('| ${item['urdu'].toString().capitalize}', colorController.whiteColor, 22.0), 
                        //                       Provider.of<TextVisibilityProvider>(context).isThirdTextVisible,),
                        //                       reusableVisibility(reusabletext('| ${item['turkish'].toString().capitalize}', colorController.whiteColor, 24.0), 
                        //                       Provider.of<TextVisibilityProvider>(context).isForTextVisible,),
                        //                     ],),
                        //   ]
                        //   )
                        //   // reusabletext('${item['english'].toString().capitalize}',colorController.whiteColor,22)
                          
                        //   )),
                      // ),
              ],
            ),
          );
        }
        }))
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



  Future<List<Map<String, dynamic>>> fetchGameCategories(String categoryId) async {
  try {
    final response = await http.post(
      Uri.parse('${PictureRepo.baseUrl}apis/get_limited_items.php'),
      body: {
        'type_id': widget.selectedCategory.toString(),
        // MySharedPrefrence().get_cat_id(),
      },
    );
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


  Future<Map<String, dynamic>> fetchGameCategories2(String categoryId) async {
  try {
    final response = await http.post(
      Uri.parse('${PictureRepo.baseUrl}apis/get_limited_items.php'),
      body: {
        'type_id': widget.selectedCategory.toString(),
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
}