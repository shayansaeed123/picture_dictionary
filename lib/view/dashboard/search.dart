// import 'dart:convert';

// import 'package:audioplayers/audioplayers.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:picture_dictionary/controller/color_controller.dart';
// import 'package:picture_dictionary/repo/category_repo.dart';
// import 'package:picture_dictionary/res/reusableappbar.dart';
// import 'package:picture_dictionary/view/dashboard/items.dart';
// import 'package:picture_dictionary/widget/sidebar.dart';
// import 'package:http/http.dart' as http;

// class SearchItem extends StatefulWidget {
//   const SearchItem({super.key});

//   @override
//   State<SearchItem> createState() => _SearchItemState();
// }

// class _SearchItemState extends State<SearchItem> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   late List<Map<String, dynamic>> items;
//   late List<Map<String, dynamic>> filteredItems;
//   TextEditingController _searchController = TextEditingController();
//   PictureRepo pictureRepo = PictureRepo();
//   final AudioPlayer audioPlayer = AudioPlayer();
//   Future<void> playAudioFromUrl(String url) async {
//     await audioPlayer.play(UrlSource(url));
//     if(url == 1){
//       print('succes');
//     }else{
//       print('fail');
//     }
//   }
//   late String selectedCategory;
//   late Future<List<String>> categoriesFuture;
//   late Future<List<Map<String, dynamic>>> itemsFuture;


//   @override
//   void initState() {
//     super.initState();
//     selectedCategory = 'Fruits'; // Default selected category
//     categoriesFuture = pictureRepo.fetchCategories();
//     itemsFuture = pictureRepo.fetchItemsByCategory(selectedCategory);
//     items = [];
//     filteredItems = [];
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     try {
//       final response = await http.get(
//           Uri.parse('https://kulyatudawah.com/public/vocgame/apis/get_types.php'));



//   void filterItems(String query) {
//     setState(() {
//       filteredItems = items
//           .where((item) =>
//               item['english'].toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         key: _scaffoldKey,
//         drawer: SideBar(),
//           appBar: reusableappbar(context, () {_scaffoldKey.currentState!.openDrawer();}, 'Search Item'),
//           body: Container(
//             decoration: BoxDecoration(
//               // backgroundBlendMode:  BlendMode.multiply,
//               image: DecorationImage(
//                 image: AssetImage('assets/second_page.png'),
//                 fit:  BoxFit.cover,
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
//                   child: TextFormField(
//                     controller: _searchController,
//                     onChanged: filterItems,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: colorController.textformfillColor,
//                       prefixIcon:  Icon(Icons.search, color: colorController.whiteColor),
//                       hintText: 'search',
//                       hintStyle: TextStyle(color: colorController.whiteColor),
//                       suffixIcon: IconButton(
//               icon: Icon(Icons.clear, color: colorController.whiteColor,),
//               onPressed: () {
//                 _searchController.clear();
//                 filterItems('');
//               },
//             ),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(25),
//                           borderSide:
//                               BorderSide(color: colorController.textformborderColor, width: 4)),
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(25),
//                           borderSide:
//                               BorderSide(color: colorController.textformborderColor, width: 4)),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(25),
//                           borderSide:
//                               BorderSide(color: colorController.textformborderColor, width: 4)),
//                       errorBorder: InputBorder.none,
//                       disabledBorder: InputBorder.none,
//                       // contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
//                     ),
//                     keyboardType: TextInputType.text,
//                   ),
//                 ),
//                 Expanded(
//                   child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount:  2,
//                           crossAxisSpacing: 10,
//                           mainAxisSpacing: 10,
//                         ), 
//                         itemCount: filteredItems.length,
//                         itemBuilder: (context, index) {
//                             return GestureDetector(
//                             onTap: () {
//                               playAudioFromUrl('${filteredItems[index]['english_voice']}');
                              
//                                 setState(() {
                                  
//                                 });
//                                   selectedCategory = filteredItems[index]['english'];
//                   itemsFuture = pictureRepo.fetchItemsByCategory(selectedCategory);
//                   print('itemsssssssssssssss ${itemsFuture.toString()}');
//                   Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
                                  
//                                   builder: (context) => ItemsPage(categoriesFuture: categoriesFuture,itemsFuture: itemsFuture,),
//                                 ));
                                
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: colorController.whiteColor,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               padding: EdgeInsets.all(10),
//                               child:  Container(
//                         width: MediaQuery.of(context).size.width * .44,
//                         height: MediaQuery.of(context).size.height * .361,
//                         decoration: BoxDecoration(color: colorController.whiteColor,borderRadius: BorderRadius.circular(11),),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Expanded(
//                               child: CachedNetworkImage(imageUrl: filteredItems[index]['image'],
//                               errorWidget: (context, url, error) => Image.asset('assets/placeholder_not_found.png'),
//                               width: double.infinity,
//                               fit: BoxFit.contain,
//                               filterQuality: FilterQuality.high,
//                               placeholder: (context, url) => Image.asset('assets/placeholder_loading.png'),
//                               )
//                             ),
//                             Container(
//                               width: double.infinity,
//                               height: MediaQuery.of(context).size.height*0.05,
//                               margin: EdgeInsets.all(MediaQuery.of(context).size.height * .001),
//                               padding: EdgeInsets.all(MediaQuery.of(context).size.height * .003),
//                               decoration: BoxDecoration(color: colorController.categoryBtnColor,borderRadius: BorderRadius.circular(8.0)),
//                               child: Center(child: Text('${filteredItems[index]['english'] }',textAlign: TextAlign.center, softWrap: true, style: TextStyle(color: Colors.white, fontFamily: 'English1',),)),
//                             ),
//                           ],
//                         ),
//                       ),
                            
//                           )
//                 );
//                         } 
//                 ))
//               ]
            
//             ),
//           )),
//     );
//   }
//                 }



import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/utils.dart';
import 'package:picture_dictionary/common/provider.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/repo/category_repo.dart';
import 'package:picture_dictionary/res/reusableCategoryTextBtn.dart';
import 'package:picture_dictionary/res/reusableVisibility.dart';
import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:picture_dictionary/res/reusableloading.dart';
import 'package:picture_dictionary/view/dashboard/itemdetails.dart';
import 'package:picture_dictionary/view/dashboard/items.dart';
import 'package:picture_dictionary/widget/sidebar.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({super.key});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  PictureRepo pictureRepo = PictureRepo();
  List<Map<String, dynamic>> items = [];
  List<Map<String, dynamic>> itemsTwo = [];
  List<Map<String, dynamic>> filteredItems = [];
  String selectedCategory = '';
  late Future<List<String>> categoriesFuture;
  late Future<List<Map<String, dynamic>>> itemsFuture;
  bool isLoading = true; // Flag to track loading state

  final AudioPlayer audioPlayer = AudioPlayer();
  Future<void> playAudioFromUrl(String url) async {
    await audioPlayer.play(UrlSource(url));
    if(url == 1){
      print('succes');
    }else{
      print('fail');
    }
  }

  void fetchAllData() async {
    var dataOne = await http.get(Uri.parse(
        "${PictureRepo.baseUrl}apis/get_types.php"));
    var dataTwo = await http.get(Uri.parse(
        "${PictureRepo.baseUrl}apis/get_items.php"));

    if (dataOne.statusCode == 200) {
      var dataOneInJson = jsonDecode(dataOne.body);

      if (dataOneInJson is Map && dataOneInJson.containsKey('types')) {
        setState(() {
          items = List<Map<String, dynamic>>.from(dataOneInJson['types'] ?? []);
        });
      }
    }
    if (dataTwo.statusCode == 200) {
      var jsonDataTwo = jsonDecode(dataTwo.body);

      if (jsonDataTwo is List) {
        List<Map<String, dynamic>> tempItemsTwo = [];

        jsonDataTwo.forEach((item) {
          if (item is Map<String, dynamic> && item.containsKey('items')) {
            var itemsInItem = item['items'];

            if (itemsInItem is List) {
              tempItemsTwo.addAll(List<Map<String, dynamic>>.from(itemsInItem));
            }
          }
        });

        setState(() {
          itemsTwo = tempItemsTwo;
          items = items + itemsTwo;
          filteredItems = items;
          isLoading = false;
        });
        
      }
    }
  }

  void performSearch(String text) {
  setState(() {
    filteredItems = items.where((item) {
      return item['english']
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()) || 
             item['urdu']
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()) || 
             item['arabic']
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()) || 
             item['turkish']
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()) || 
             item['chinese']
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()) || 
             item['pashto']
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase());
    }).toList();
  });

  print("Filtered Items: $filteredItems");
}

  void onSearchChange(String text) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(Duration(seconds: 1), () {
      performSearch(text);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAllData();
    _searchController.addListener(() {
      onSearchChange(_searchController.text);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: SideBar(),
        appBar: reusableappbar(context, () {
          _scaffoldKey.currentState!.openDrawer();
        }, ''),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/second_page.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * .01),
                child: TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: colorController.textformfillColor,
                    prefixIcon: Icon(Icons.search,
                        color: colorController.whiteColor),
                    hintText: 'search',
                    hintStyle: TextStyle(color: colorController.whiteColor),
                    
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: colorController.whiteColor,
                      ),
                      onPressed: () {
                        _searchController.clear();
                        performSearch('');
                      },
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            color: colorController.textformborderColor,
                            width: 4)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            color: colorController.textformborderColor,
                            width: 4)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            color: colorController.textformborderColor,
                            width: 4)),
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              isLoading
              ? Center(child: reusableloadingrow(context, true),) // Show loading while fetching data
              : 
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                        int currentItem = index;
                        int id = int.parse(filteredItems[index]['id']);
                    return GestureDetector(
                    onTap: () {
  playAudioFromUrl('${filteredItems[index]['english_voice']}');

  setState(() {
    selectedCategory = filteredItems[index]['english'];
  });
  categoriesFuture = pictureRepo.fetchCategories();
  itemsFuture = pictureRepo.fetchItemsByCategory(selectedCategory); 
  print('Selected Category: $selectedCategory');
  print('Items Future: $itemsFuture');

  if (filteredItems[index]['item_type'] == "categories") {
 
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemsPage(
          categoriesFuture: categoriesFuture, 
          itemsFuture: itemsFuture,           
        ),
      ),
    );
  } else if (filteredItems[index]['item_type'] == "items") {
    Navigator.push(context, MaterialPageRoute(builder: (_)=> ItemDetails(
                          items: items,
                          current: currentItem,
                          id: id, item: {},
                          )));
  } else {
    print("Unknown type: ${filteredItems[index]['type']}");
  }
},
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorController.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CachedNetworkImage(
                                imageUrl: filteredItems[index]['image'],
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                        'assets/placeholder_not_found.png'),
                                width: double.infinity,
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.high,
                                placeholder: (context, url) => Image.asset(
                                    'assets/placeholder_loading.png'),
                              ),
                            ),
                            reusableCategoryTextBtn(
                                          context, 
                                          '${filteredItems[index]['english'].toString().capitalize}',
                                          colorController.categoryBtnColor,'English1'),
                                      reusableVisibility(
                                        reusableCategoryTextBtn(
                                            context,
                                            '${filteredItems[index]['arabic'].toString().capitalize}',
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
                                            '${filteredItems[index]['urdu'].toString().capitalize}',
                                            colorController.urduTextBtnColor,'urdu2'),
                                        Provider.of<TextVisibilityProvider>(
                                                context)
                                            .isThirdTextVisible,
                                      ),
                                      reusableVisibility(
                                        reusableCategoryTextBtn(
                                            context,
                                            '${filteredItems[index]['turkish'].toString().capitalize}',
                                            colorController
                                                .turkishTextBtnColor,''),
                                        Provider.of<TextVisibilityProvider>(
                                                context)
                                            .isForTextVisible,
                                      ),

                                      reusableVisibility(
                                        reusableCategoryTextBtn(
                                            context,
                                            '${filteredItems[index]['chinese'].toString().capitalize}',
                                            colorController.chineseTextBtnColor,''),
                                        Provider.of<TextVisibilityProvider>(
                                                context)
                                            .isFiveTextVisible,
                                      ),
                                      reusableVisibility(
                                        reusableCategoryTextBtn(
                                            context,
                                            '${filteredItems[index]['pashto'].toString().capitalize}',
                                            colorController
                                                .pashtoTextBtnColor,''),
                                        Provider.of<TextVisibilityProvider>(
                                                context)
                                            .isSixTextVisible,
                                      ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// onTap: () {
//   playAudioFromUrl('${filteredItems[index]['english_voice']}');

//   setState(() {
//     selectedCategory = filteredItems[index]['english'];
//   });

//   if (filteredItems[index]['item_type'] == "categories") {
//     // If it's a category, fetch the items for that category and navigate to ItemsPage
//     categoriesFuture = pictureRepo.fetchCategories();
//     itemsFuture = pictureRepo.fetchItemsByCategory(selectedCategory); 
//     print('Selected Category: $selectedCategory');
//     print('Items Future: $itemsFuture');

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ItemsPage(
//           categoriesFuture: categoriesFuture, 
//           itemsFuture: itemsFuture,           
//         ),
//       ),
//     );
//   } else if (filteredItems[index]['item_type'] == "items") {
//     // If it's an item, go directly to ItemDetails page
//     int currentItem = index;
//     int id = int.parse(filteredItems[index]['id']);

//     Navigator.push(context, MaterialPageRoute(
//       builder: (_) => ItemDetails(
//         items: items,
//         current: currentItem,
//         id: id,
//         item: filteredItems[index], // Pass the current item details
//       )));
//   } else {
//     print("Unknown type: ${filteredItems[index]['type']}");
//   }
// },