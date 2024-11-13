
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
import 'package:picture_dictionary/view/dashboard/game_page_two.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../res/audioplayer.dart';

class wheelgametwo extends StatefulWidget {
  final String selectedCategory;
  final Future<List<Map<String, dynamic>>> itemsFuture;
  final Future<Map<String, dynamic>> itemsFuture2;
  const wheelgametwo({Key? key,required this.selectedCategory, required this.itemsFuture,
  required this.itemsFuture2
  }) : super(key: key);

  @override
  State<wheelgametwo> createState() => _wheelgametwoState();
}

class _wheelgametwoState extends State<wheelgametwo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Future<List<Map<String, dynamic>>> _itemsFuture;  
  late Future<Map<String, dynamic>> _itemsFuture2;
   String countValue = '0';
     late Random random;
  late int randomNumber;


  List<String> imageUrls = [];
  int _selectedIndex = -1;
 String questionID = '';
  String answerID = '';
//  String countValue = '0';

  late Future<Map<String,dynamic>> items;
  late Future<Map<String,dynamic>> repeatedItems;
  
         int selectedContainerIndex = -1;
         // Function to save the selected index in SharedPreferences
void saveSelectedIndex(int index) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('selected_index', index);
}

Future<int> getSelectedIndex() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('selected_index') ?? -1; 
}

  @override
  void initState() {
    super.initState();
      _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds:50),
    )..repeat();
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
    print('User Id ${MySharedPrefrence().get_user_id()}');
  });
    // _btnItemsFuture = widget.btnItemsFuture;
  }
  late int userid;

  int isLogin() {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    
    if (MySharedPrefrence().get_user_id() != 0) {
      // userid = user.uid.toString();
      setState(() {
        
      });
      // MySharedPrefrence().set_user_id(user.uid);
      print('User Id ${MySharedPrefrence().get_user_id()}');
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
      Uri.parse('${PictureRepo.baseUrl}apis/wheels_add_question_answers_status_voice.php'),
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
    Uri.parse('${PictureRepo.baseUrl}apis/wheels_count_question_answers_voice.php'),
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







int count = 1;
 @override
Widget build(BuildContext context) {
  double radius = 100.0; 
  return WillPopScope(
     onWillPop: () async {
           final response = await http.post(
      Uri.parse('${PictureRepo.baseUrl}apis/clear_voice_and_wheel_results.php'),
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
      appBar: AppBar(
        title: Text("Wheel Game"),
        backgroundColor: Color(0xFFffb64d),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorController.bgColorup,
              colorController.bgColordown,
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  reusabletext('Quiz # $count', colorController.blackColor, 22),
                  reusabletext('Score: $countValue/10', colorController.blackColor, 22),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<Map<String, dynamic>>(
                future: _itemsFuture2,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: reusableloadingrow(context, true));
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    Map<String, dynamic> itemsMap = snapshot.data!;
                    List<dynamic> items = itemsMap['items'];
                    List<dynamic> repeatedItems = itemsMap['repeatedItems'];
    
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * .01),
                          for (var item in repeatedItems)
                            InkWell(
                              onTap: () {
                                questionID = item['id'];
                                questionApi();
                                CountApi();
                                _refreshItems();
                                if (count == 10) {
                                  count = 0;
                                  setState(() {
                                    if (int.parse(countValue.toString()) >= int.parse('6')) {
                                      reusableAnimation(context, 'assets/congrats.json', 'Next', countValue);
                                    } else {
                                      reusableAnimation(context, 'assets/failed.json', 'Try Again', countValue);
                                    }
                                  });
                                } else {
                                  setState(() {
                                    count++;
                                  });
                                }
                              },
                           
                              child: Container(
                          height: MediaQuery.of(context).size.height * .15,
                          width: MediaQuery.of(context).size.width * .8,
                          decoration: BoxDecoration(image: DecorationImage(
                            image: AssetImage('assets/et_bg.png'),filterQuality: FilterQuality.high,fit: BoxFit.contain,)),
                          child: Center(child: 
                          
                          Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          // reusabletext('${item['english'].toString().capitalize} ', colorController.whiteColor, 24.0),
                                            SizedBox(height: 16.0),
                                            Row(children: [
                                              reusableVisibility(reusabletext('${item['english'].toString().capitalize}', colorController.whiteColor, 22.0), 
                                              Provider.of<TextVisibilityProvider>(context).englishbtn,),
                                              reusableVisibility(reusabletext('${item['english'].toString().capitalize}', colorController.whiteColor, 22.0), 
                                              Provider.of<TextVisibilityProvider>(context).isSecondTextVisible,),
                                              reusableVisibility(reusabletext('${item['arabic'].toString().capitalize}', colorController.whiteColor, 22.0), 
                                              Provider.of<TextVisibilityProvider>(context).isFirstTextVisible,),
                                              reusableVisibility(reusabletext('${item['urdu'].toString().capitalize}', colorController.whiteColor, 22.0), 
                                              Provider.of<TextVisibilityProvider>(context).isThirdTextVisible,),
                                              reusableVisibility(reusabletext('${item['turkish'].toString().capitalize}', colorController.whiteColor, 24.0), 
                                              Provider.of<TextVisibilityProvider>(context).isForTextVisible,),

                                              reusableVisibility(reusabletext('${item['chinese'].toString().capitalize}', colorController.whiteColor, 22.0), 
                                              Provider.of<TextVisibilityProvider>(context).isFiveTextVisible,),
                                              reusableVisibility(reusabletext('${item['pashto'].toString().capitalize}', colorController.whiteColor, 24.0), 
                                              Provider.of<TextVisibilityProvider>(context).isSixTextVisible,),
                                            ],),
                          ]
                          )
                          )),
                          
                            ),
                       Padding(
                         padding: const EdgeInsets.only(top: 20),
                         child: Center(
                           child: AnimatedBuilder(
                             animation: _controller,
                             builder: (context, child) {
                               return Container(
                                 width: radius * 1 + 190,
                                 height: radius * 1 + 190,
                                 child: Stack(
                                   alignment: Alignment.center,
                                   children: [
                                     ...List.generate(items.length, (index) {
                                       double angle = 2 * pi * index / items.length;
                                       double x = radius * cos(angle + _controller.value * 2 * pi);
                                       double y = radius * sin(angle + _controller.value * 2 * pi);
                                       return Positioned(
                                         left: x + radius - 2,
                                         top: y + radius - 2,
                                         child: Container(
                                           decoration: BoxDecoration(
                                             shape: BoxShape.circle,
                                             border: Border.all(
                          color: Colors.orange,
                          width: 4.0,
                                             ),
                                           ),
                                           child: Column(
                                             children: [
                          for (var item in repeatedItems)
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedContainerIndex = index;
                                });
                                answerID = items[index]['id'];
                                saveSelectedIndex(index);
                                questionID = item['id'];
                                questionApi();
                                CountApi();
                                _refreshItems();
                                if (count == 10) {
                                  count = 0;
                                  setState(() {
                                    if (int.parse(countValue.toString()) >= int.parse('6')) {
                                      reusableAnimation(context, 'assets/congrats.json', 'Next', countValue);
                                    } else {
                                      reusableAnimation(context, 'assets/failed.json', 'Try Again', countValue);
                                    }
                                  });
                                } else {
                                  setState(() {
                                    count++;
                                  });
                                }
                              },
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(items[index]['image']),
                                radius: 40.0,
                              ),
                            ),
                                             ],
                                           ),
                                         ),
                                       );
                                     }),
                                   ],
                                 ),
                               );
                             },
                           ),
                         ),
                       ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
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
