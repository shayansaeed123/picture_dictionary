import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/res/re_text.dart';
import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:picture_dictionary/res/reusableloading.dart';
import 'package:picture_dictionary/view/dashboard/items.dart';
import 'package:picture_dictionary/widget/sidebar.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:audioplayers/audioplayers.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> item = [];
  bool _isLoading = false;
  late int id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<dynamic> fetchData() async {
    setState(() {
      _isLoading = true;
    });

    try{
      // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint
    String apiUrl =
        'https://kulyatudawah.com/public/vocgame/apis/get_types.php';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      print('response ${response.body.toString()}');
      final data = json.decode(response.body);
      print('data ${data.toString()}');
      // print('idddddddddddddd ${data['types']['id']}');
      setState(() {
        final items = data['types'] as List<dynamic>;
        item = items;
      });
      setState(() {
      _isLoading = false;
    });
      return data;
    } else {
      // Handle API error
    }
    }catch(e){
      print("Error $e");
    }finally{
      setState(() {
      _isLoading = false;
    });
    }
  }

  final AudioPlayer audioPlayer = AudioPlayer();

  // void playAudio() {
  //   audioPlayer.play('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');
  // }

  @override
  Widget build(BuildContext context) {
    List<String> categories = item.map((e) => e['english'] as String).toList();
    return Scaffold(
        key: _scaffoldKey,
        // backgroundColor: Color(0xFFffb64d),
        appBar: reusableappbar(context, () {
          _scaffoldKey.currentState!.openDrawer();
        }, 'CATEGORIES'),
        drawer: SideBar(fetchDataCallback: fetchData, categories: categories,),
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
                child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: item.length > 5 ? item.length - 2 : 0,
                      itemBuilder: (context, index) {
                        final type = item[index];
                        return GestureDetector(
                          onTap: () {
                            // Handle item tap
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemsPage(fetchDataCallback: fetchData, categories: categories,),
                              ));
                              void playAudio(){
                                audioPlayer.play(type['english_voice']);
                              }
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
                            child: Center(child: Text('${type['english'] + type['id']}',textAlign: TextAlign.center, softWrap: true, style: TextStyle(color: Colors.white, fontFamily: 'English1',),)),
                          ),
                        ],
                      ),
                    ),
                          ),
                        );
                      },
                    ),
              ),
            ),
              if (_isLoading == true) reusableloadingrow(context, _isLoading),
              reusableloadingrow(context, _isLoading)
          ],
        ));
  }
}
