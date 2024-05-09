import 'dart:convert';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:picture_dictionary/common/MySharedPrefrence.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/repo/category_repo.dart';
import 'package:picture_dictionary/res/re_text.dart';
import 'package:picture_dictionary/res/reusableloading.dart';
import 'package:http/http.dart' as http;
import 'package:picture_dictionary/view/dashboard/game_page_two.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GamePageThree extends StatefulWidget {
  final String selectedCategory;
  final Future<List<Map<String, dynamic>>> itemsFuture;
  final Future<Map<String, dynamic>> itemsFuture2;
  const GamePageThree({Key? key,required this.selectedCategory, required this.itemsFuture,
  required this.itemsFuture2
  }) : super(key: key);

  @override
  State<GamePageThree> createState() => _GamePageThreeState();
}

class _GamePageThreeState extends State<GamePageThree> {
  late Future<List<Map<String, dynamic>>> _itemsFuture;
  late Future<Map<String, dynamic>> _itemsFuture2;

  @override
  void initState() {
    super.initState();
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
  late String userid;
  late int countValue;

  String isLogin() {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    
    // String userid = user!.uid.toString();
    // print('User Id $userid');
    if (user != null) {
      // userid = user.uid.toString();
      setState(() {
        
      });
      MySharedPrefrence().set_user_id(user.uid.toString());
      print('User Id ${MySharedPrefrence().get_user_id()}');
      setState(() {
        
      });
      return MySharedPrefrence().get_user_id();
    }else{
      userid = '101';
    return userid;
    }
    
  }

  Future<Map<String, dynamic>> questionApi()async{
    final response = await http.post(
      Uri.parse('https://kulyatudawah.com/public/vocgame/apis/add_question_answers_status.php'),
      body: {
        'user_id': MySharedPrefrence().get_user_id(),
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
    Uri.parse('https://kulyatudawah.com/public/vocgame/apis/count_question_answers.php'),
    body: {
      'user_id': MySharedPrefrence().get_user_id(),
      'type_id': widget.selectedCategory.toString(),
    },
  );
  if (response.statusCode == 200) {
    try {
      var data = jsonDecode(response.body.toString());
      setState(() {
        // Update the global variable with the count value
        countValue = int.parse(data['count']);
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

  // if (response.statusCode == 200) {
  //   try {
  //     print('object');
  //     var data = jsonDecode(response.body.toString());
  //     setState(() {});
  //     print('Count Api Response : $data');
  //     print('User Id ${MySharedPrefrence().get_user_id()}');
  //     return data;
  //   } catch (e) {
  //     print('Error parsing JSON: $e');
  //     // Handle the error, return a default value, or show an error message
  //     throw Exception('Error $e');
  //   }
  // } else {
  //   print('HTTP error ${response.statusCode}: ${response.reasonPhrase}');
  //   // Handle the HTTP error, return a default value, or show an error message
  //   throw Exception('Error $e');
  // }
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
int score = 0;

void gamescore(){
  if(answerID == questionID){
    score++;
  }else{
    score = score;
  }
}

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fruits'),backgroundColor: Color(0xFFffb64d),automaticallyImplyLeading: false,),

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

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
            
              children: [
                // for (var item in items)
                
                for (int index = 0; index < items.length; index++)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .02,),
                    child: InkWell(
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
                    width: 2,
                  ),
                        ),
                        child: Image.network(items[index]['image'],errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/placeholder_not_found.png');
                        },)
                        ),
                    ),
                  ),
                
              ],
               ),
               SizedBox(height: MediaQuery.of(context).size.height * .02,),
               for (var item in repeatedItems)
                  InkWell(
                    onTap: (){
                      questionID = item['id'];
                      questionApi();
                      CountApi();
                      gamescore();
                      _refreshItems();
                      if(count == 10){
                        count = 0;
                        setState(() {
                          if(countValue == '7'){
                            
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
                      height: MediaQuery.of(context).size.height * .25,
                      width: MediaQuery.of(context).size.width * .8,
                      decoration: BoxDecoration(image: DecorationImage(
                        
                        image: AssetImage('assets/et_bg.png'),filterQuality: FilterQuality.high,fit: BoxFit.contain,)),
                      child: Center(child: reusabletext('${item['english'].toString().capitalize}',colorController.whiteColor,22))),
                  ),
          ],
        );
      }
  }))
      //   return ListView(
      //     children: [
      //       Text('Items:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // for (var item in items)
            //   ListTile(
            //     title: Text(item['english']),
            //     subtitle: Image.network(item['image']),
            //   ),
      //       Text('Repeated Items:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      //       for (var item in repeatedItems)
      //         InkWell(
      //           onTap: () {
      //             _refreshItems();
      //           },
      //           child: ListTile(
      //             title: Text(item['english']),
      //             subtitle: Image.network(item['image']),
      //           ),
      //         ),
      //     ],
      //   );
      // }
      //         },)
      //       ),

            // ListView(
            //         children: [
            //           Text('Items:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            //           for (var item in items)
            //                 ListTile(
            //   title: Text(item['english']),
            //   subtitle: Image.network(item['image']),
            //                 ),
            //           Text('Repeated Items:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            //           for (var item in repeatedItems)
            //                 InkWell(
            //   onTap: (){
            //     setState(() {
                  
            //     });
            //     initializeData();
            //     print('object');
            //     setState(() {
                  
            //     });
            //   },
            //   child: ListTile(
            //     title: Text(item['english']),
            //     subtitle: Image.network(item['image']),
            //   ),
            //                 ),
            //         ],
            //       )
            // Container(
            //   height: MediaQuery.of(context).size.height * .78,
            //   child: 

            //   // Expanded(
            //   //   child: 
            //     FutureBuilder(
            //       future: _itemsFuture,
            //       builder: (context, snapshot) {
            //         if (snapshot.connectionState == ConnectionState.waiting) {
            //           return Center(child: reusableloadingrow(context, true));
            //         } else if (!snapshot.hasData) {
            //           return Center(child: Text('No data'));
            //         } else {
            //           List<Map<String, dynamic>> items =
            //               snapshot.data as List<Map<String, dynamic>>;
            //           return Padding(
            //             padding: const EdgeInsets.all(20.0),
            //             child: GridView.builder(
            //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //                 crossAxisCount: 2,
            //                 crossAxisSpacing: 30,
            //                 mainAxisSpacing: 10
            //                 ),
            //               itemCount: items.length -1 ,
            //               itemBuilder: (context, index) {
            //                 Map<String, dynamic> item = items[index];
            //                 print('object${item['id']}');
            //                 return 
            //                     Column(
            //                       children: [
            //                         Container(
            //                           // height: MediaQuery.of(context).size.height * .75,
            //                           decoration: BoxDecoration(
            //                         color: colorController.whiteColor,
            //                         borderRadius: BorderRadius.circular(11),
                                    
            //                                                       ),
            //                                                       child: Center(child: Image.network(item['image'],width: 150,)),
            //                          ),
            //                         if (index == items.length - 2)... {
            //    Center(
            //     child: InkWell(
            //       onTap: (){
            //         _refreshItems();
            //       },
            //       child: reusabletext(item['english'], colorController.blackColor, 22)),
            //   ),
            // }
            //                         //  reusabletext(item['english'], colorController.blackColor, 22)
            //                       ],
            //                     );
                             
            //               },
            //             ),
            //           );
            //         }
            //       },
            //     ),
            //   ),
            // ),
  //           Expanded(
  //             child: FutureBuilder(future: _itemsFuture,builder: (context, snapshot) {
  //               if (snapshot.connectionState == ConnectionState.waiting) {
  //                     return Center(child: reusableloadingrow(context, true));
  //                   } else if (!snapshot.hasData) {
  //                     return Center(child: Text('No data'));
  //                   } else {
  //               List<Map<String, dynamic>> items =
  //                         snapshot.data as List<Map<String, dynamic>>;

  //                         return ListView.builder(
  //                           itemCount: items.length,
  //                           itemBuilder: (context, index) {
  //                           Map<String, dynamic> item = items[index];
  //                           return InkWell(
  //                             onTap: (){
  //                               print('objectbfsdgifggfbliakgSLFGVHJfkdsFVDFVSJDFV ${item['id']}');
  //                                _refreshItems();
  //                   // _refreshBtnItems();
  //                   // hello();
  //                             },
  //                             child: Container(
  //                               decoration: BoxDecoration(
  //                                 image: DecorationImage(
  //                                   image: AssetImage('assets/et_bg.png'),
  //                                   filterQuality: FilterQuality.high,
  //                                   fit: BoxFit.contain
  //                                 ),
  //                               ),
  //                               child: Center(child: reusabletext(item['english'], colorController.blackColor, 20),)
  //                             ),
  //                           ) ;
  //                         },);
  // }},)
  //           )

  
            // Expanded(
            //   flex: 1,
            //   child: Container(
            //     // margin: EdgeInsets.only(bottom: 40),
            //     child: ElevatedButton(
            //       onPressed: (){
                    // _refreshItems();
                    // _refreshBtnItems();
            //       },
            //       child: Text('Refresh'),
            //     ),
            //   ),
            // ),
          ],
        ),
        
      ),
    );
  }

  void _refreshItems(){
    setState(() {
      _itemsFuture2 =  fetchGameCategories2(widget.selectedCategory);
    });
  }

 

// Future<void> _refreshBtnItems() async {
//     setState(() {
//       print('kbfjbvkxhbujkf.bjx.kjbf.kbvgf.0');
//       _btnItemsFuture = fetchGameBtnData(widget.selectedCategory);
//     });
//   }
  // Future<void> hello()async{
  //   await _refreshItems();
  //   await _refreshBtnItems();
  // }


  Future<List<Map<String, dynamic>>> fetchGameCategories(String categoryId) async {
  try {
    final response = await http.post(
      Uri.parse('https://kulyatudawah.com/public/vocgame/apis/get_limited_items.php'),
      body: {
        'type_id': widget.selectedCategory.toString(),
        // MySharedPrefrence().get_cat_id(),
      },
    );
// setState(() {});
//     print('ID1 ${widget.selectedCategory}');
// setState(() {});
    if (response.statusCode == 200) {
      dynamic jsonResponse = jsonDecode(response.body);
      List<Map<String, dynamic>> items = [];
      // for (var type in jsonResponse) {
      //   setState(() {});
      //     print('ID2 ${categoryId}');
      //   if (type['type_id'] == categoryId) { // Convert type_id to String
      //     items.addAll(type['items'].cast<Map<String, dynamic>>());
      //     items.addAll(type['repeateditems'].cast<Map<String, dynamic>>());
      //     print('Added items: $items');
      //     break;
      //   }
      // }


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

//    Future<List<Map<String, dynamic>>> fetchGameBtnData(String categoryId) async {
//   try {
//     final response = await http.post(
//       Uri.parse('https://kulyatudawah.com/public/vocgame/apis/get_limited_items.php'),
//       body: {
//         'type_id': widget.selectedCategory.toString(),
//         // MySharedPrefrence().get_cat_id(),
//       },
//     );
// setState(() {});
//     print('ID1 ${widget.selectedCategory}');
// setState(() {});
//     if (response.statusCode == 200) {
//       dynamic jsonResponse = jsonDecode(response.body);
//       List<Map<String, dynamic>> items = [];
//       for (var type in jsonResponse) {
//         setState(() {});
//           print('ID2 ${categoryId}');
//         if (type['type_id'] == categoryId) { // Convert type_id to String
//           // items.addAll(type['items'].cast<Map<String, dynamic>>());
//           items.addAll(type['repeateditems'].cast<Map<String, dynamic>>());
//           print('Added items: $items');
//           break;
//         }
//       }
//       print('Game All Items $items');
      
//       return items;
//     } else {
//       throw Exception('failed to load data');
//     }
//   } catch (e) {
//     print('Error: $e');
//     throw Exception('failed to load data');
//   } finally {
//     // _isLoading = false;
//   }
//    }


  Future<Map<String, dynamic>> fetchGameCategories2(String categoryId) async {
  try {
    final response = await http.post(
      Uri.parse('https://kulyatudawah.com/public/vocgame/apis/get_limited_items.php'),
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
