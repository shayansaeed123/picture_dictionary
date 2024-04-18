import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:picture_dictionary/common/MySharedPrefrence.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/repo/category_repo.dart';
import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:picture_dictionary/res/reusableloading.dart';
import 'package:picture_dictionary/view/dashboard/itemdetails.dart';
import 'package:picture_dictionary/view/dashboard/items.dart';
import 'package:picture_dictionary/widget/sidebar.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({super.key});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
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
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: SideBar(),
          appBar: reusableappbar(context, () {}, 'Search Item'),
          body: Container(
            decoration: BoxDecoration(
              // backgroundBlendMode:  BlendMode.multiply,
              image: DecorationImage(
                image: AssetImage('assets/second_page.png'),
                fit:  BoxFit.cover,
              ),
            ),
            // width: MediaQuery.of(context).size.width,
            // height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
                  child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: colorController.textformfillColor,
                      prefixIcon:  Icon(Icons.search, color: colorController.whiteColor),
                      hintText: 'search',
                      hintStyle: TextStyle(color: colorController.whiteColor),
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
                FutureBuilder(future: PictureRepo().fetchData(), builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: Text('Type to Search', style: TextStyle(fontSize: 25),)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Center(child: Text('Enter any category in your prefered language to search', style: TextStyle(fontSize: 16),)),
                        ),
                    ],),
                );
                  }else{



                    if(_searchController.text.isEmpty){
                      return Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: Text('Type to Search', style: TextStyle(fontSize: 25),)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Center(child: Text('Enter any category in your prefered language to search', style: TextStyle(fontSize: 16),)),
                        ),
                    ],),
                );
                    }else {
                      List<Map<String, dynamic>> data = snapshot.data!;
                      return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: data.length > 5 ? data.length - 2 : 0,
                      // item.length > 5 ? item.length - 2 : 0,
                      itemBuilder: (context, index) {
                         Map<String, dynamic> type = data[index];
                        // final type = item[index];
                        return GestureDetector(
                          onTap: () {
                            playAudioFromUrl('${type['english_voice']}');
                            
                              setState(() {
                                selectedCategory = type['english'];
                itemsFuture = pictureRepo.fetchItemsByCategory(selectedCategory);
                print('itemsssssssssssssss ${itemsFuture.toString()}');
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                
                                builder: (context) => ItemsPage(categoriesFuture: categoriesFuture,itemsFuture: itemsFuture,),
                              ));
              });
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
                            child: CachedNetworkImage(imageUrl: type['image'],
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
                            child: Center(child: Text('${type['english'] }',textAlign: TextAlign.center, softWrap: true, style: TextStyle(color: Colors.white, fontFamily: 'English1',),)),
                          ),
                        ],
                      ),
                    ),
                          ),
                        );
                      },
                    );





                    }




                  }
                },),
                
                    
                  
                    
                
              ],
            ),
          )),
    );
  }
}
