import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/repo/category_repo.dart';
import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:picture_dictionary/view/dashboard/items.dart';
import 'package:picture_dictionary/widget/sidebar.dart';
import 'package:http/http.dart' as http;

class SearchItem extends StatefulWidget {
  const SearchItem({super.key});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late List<Map<String, dynamic>> items;
  late List<Map<String, dynamic>> filteredItems;
  TextEditingController _searchController = TextEditingController();
  PictureRepo pictureRepo = PictureRepo();
  final AudioPlayer audioPlayer = AudioPlayer();
  Future<void> playAudioFromUrl(String url) async {
    await audioPlayer.play(UrlSource(url));
    if(url == 1){
      print('succes');
    }else{
      print('fail');
    }
  }
  late String selectedCategory;
  late Future<List<String>> categoriesFuture;
  late Future<List<Map<String, dynamic>>> itemsFuture;


  @override
  void initState() {
    super.initState();
    selectedCategory = 'Fruits'; // Default selected category
    categoriesFuture = pictureRepo.fetchCategories();
    itemsFuture = pictureRepo.fetchItemsByCategory(selectedCategory);
    items = [];
    filteredItems = [];
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
          Uri.parse('https://kulyatudawah.com/public/vocgame/apis/get_types.php'));

      if (response.statusCode == 200) {
        dynamic jsonResponse = jsonDecode(response.body);
        List<Map<String, dynamic>> listResponse =
            jsonResponse['types'].cast<Map<String, dynamic>>();
        setState(() {
          items = listResponse;
          filteredItems = items;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error : $e');
      rethrow;
    }
  }

  void filterItems(String query) {
    setState(() {
      filteredItems = items
          .where((item) =>
              item['english'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: SideBar(),
          appBar: reusableappbar(context, () {_scaffoldKey.currentState!.openDrawer();}, 'Search Item'),
          body: Container(
            decoration: BoxDecoration(
              // backgroundBlendMode:  BlendMode.multiply,
              image: DecorationImage(
                image: AssetImage('assets/second_page.png'),
                fit:  BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
                  child: TextFormField(
                    controller: _searchController,
                    onChanged: filterItems,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: colorController.textformfillColor,
                      prefixIcon:  Icon(Icons.search, color: colorController.whiteColor),
                      hintText: 'search',
                      hintStyle: TextStyle(color: colorController.whiteColor),
                      suffixIcon: IconButton(
              icon: Icon(Icons.clear, color: colorController.whiteColor,),
              onPressed: () {
                _searchController.clear();
                filterItems('');
              },
            ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: colorController.textformborderColor, width: 4)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: colorController.textformborderColor, width: 4)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: colorController.textformborderColor, width: 4)),
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      // contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Expanded(
                  child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:  2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ), 
                        itemCount: filteredItems.length,
                        itemBuilder: (context, index) {
                            return GestureDetector(
                            onTap: () {
                              playAudioFromUrl('${filteredItems[index]['english_voice']}');
                              
                                setState(() {
                                  
                                });
                                  selectedCategory = filteredItems[index]['english'];
                  itemsFuture = pictureRepo.fetchItemsByCategory(selectedCategory);
                  print('itemsssssssssssssss ${itemsFuture.toString()}');
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  
                                  builder: (context) => ItemsPage(categoriesFuture: categoriesFuture,itemsFuture: itemsFuture,),
                                ));
                                
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: colorController.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(10),
                              child:  Container(
                        width: MediaQuery.of(context).size.width * .44,
                        height: MediaQuery.of(context).size.height * .361,
                        decoration: BoxDecoration(color: colorController.whiteColor,borderRadius: BorderRadius.circular(11),),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CachedNetworkImage(imageUrl: filteredItems[index]['image'],
                              errorWidget: (context, url, error) => Image.asset('assets/placeholder_not_found.png'),
                              width: double.infinity,
                              fit: BoxFit.contain,
                              filterQuality: FilterQuality.high,
                              placeholder: (context, url) => Image.asset('assets/placeholder_loading.png'),
                              )
                            ),
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height*0.05,
                              margin: EdgeInsets.all(MediaQuery.of(context).size.height * .001),
                              padding: EdgeInsets.all(MediaQuery.of(context).size.height * .003),
                              decoration: BoxDecoration(color: colorController.categoryBtnColor,borderRadius: BorderRadius.circular(8.0)),
                              child: Center(child: Text('${filteredItems[index]['english'] }',textAlign: TextAlign.center, softWrap: true, style: TextStyle(color: Colors.white, fontFamily: 'English1',),)),
                            ),
                          ],
                        ),
                      ),
                            
                          )
                );
                        } 
                ))
              ]
            
            ),
          )),
    );
  }
                }


