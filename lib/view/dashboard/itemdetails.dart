import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picture_dictionary/common/provider.dart';
import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:picture_dictionary/res/reusableitemdetailsrow.dart';
import 'package:picture_dictionary/res/reusablenextitembtn.dart';
import 'package:picture_dictionary/widget/sidebar.dart';
import 'package:provider/provider.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
class ItemDetails extends StatefulWidget {
  // String ar_voice ,ur_voice , en_voice, tr_voice , ar_name , ur_name , en_name , tr_name , img;
  int current,id;
  List<Map<String, dynamic>> items;
   ItemDetails({super.key, 
  // required this.ar_voice, 
  // required this.ur_voice,
  // required this.en_voice, 
  // required this.tr_voice,
  // required this.ar_name, 
  // required this.ur_name,
  // required this.en_name, 
  // required this.tr_name,
  // required this.img, 
  required this.items,
  required this.current,
  required this.id,
  required Map<String, dynamic> item,
  });

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AudioPlayer audioPlayer = AudioPlayer();
  late PageController _pageController;
  late int _currentPageIndex;
  Future<void> playAudioFromUrl(String url) async {
    await audioPlayer.play(UrlSource(url));
    if(url == 1){
      print('succes');
    }else{
      print('fail');
    }
  }

  
String currentImageUrl = ''; // Add this variable to hold the current image URL
  String currentNameEng = '';
  String currentNameAr = '';
  String currentNameUr = '';
  String currentNameTur = ''; // Add this variable to hold the current name
  String currentNameChi = '';
  String currentNamePas = ''; 
  String currentVoiceEng = '';
  String currentVoiceAr = '';
  String currentVoiceUr = '';
  String currentVoiceTur = '';
  String currentVoiceChi = '';
  String currentVoicePas = '';

  @override
  void initState() {
    super.initState();
    // Initialize the image and name based on the initial ID
    _pageController = PageController(initialPage: widget.current);
    _currentPageIndex = widget.current;
    updateImageAndName();
  }

  void updateImageAndName() {
  // Fetch image URL and name based on the current ID
  Map<String, dynamic>? currentItem = widget.items.firstWhere(
    (item) => int.parse(item['id']) == widget.id,
    orElse: () => null!,
  );
  setState(() {
    if (currentItem != null) {
     currentImageUrl = currentItem['image'] ?? '';
      currentNameEng = currentItem['english'] ?? '';
      currentNameUr = currentItem['urdu'] ?? '';
      currentNameAr = currentItem['arabic'] ?? '';
      currentNameTur = currentItem['turkish'] ?? '';
      currentNameChi = currentItem['chinese'] ?? '';
      currentNamePas = currentItem['pashto'] ?? '';
      currentVoiceEng = currentItem['english_voice'] ?? '';
      currentVoiceUr = currentItem['urdu_voice'] ?? '';
      currentVoiceAr = currentItem['arabic_voice'] ?? '';
      currentVoiceTur = currentItem['turkish_voice'] ?? '';
      currentVoiceChi = currentItem['chinese_voice'] ?? '';
      currentVoicePas = currentItem['pashto_voice'] ?? '';
    } else {
      // Handle the case when currentItem is null (ID not found)
      currentImageUrl = ''; // Set default image URL or show an error image
      currentNameEng = ''; // Set default name or show an error message
    }
  });
}




// void moveToNextItem() {
//   if (widget.current < widget.items.length ) {
//     setState(() {
//       widget.current++; // Move to the next ID
//       widget.id = int.parse(widget.items[widget.current]['id']);
//       print(widget.id);
//       updateImageAndName();
//     });
//     // fetchData(currentItemId);
//   }
// }

void moveToNextItem() {
  if (_currentPageIndex < widget.items.length ) {
    setState(() {
      _currentPageIndex++; // Move to the next ID
      widget.id = int.parse(widget.items[_currentPageIndex]['id']);
      print(widget.id);
       _pageController.jumpToPage(_currentPageIndex); // Synchronize the PageController
      updateImageAndName();
    });
    // fetchData(currentItemId);
  }
}

// void moveToPreviousItem() {
//   if (widget.current > 0) {
//     setState(() {
//       widget.current--; 
//       widget.id = int.parse(widget.items[widget.current]['id']);
//       print(widget.id);
//       updateImageAndName();
//       // print('hello');
//     });
//     // fetchData(currentItemId);
//   }
// }

void moveToPreviousItem() {
  if (_currentPageIndex > 0) {
    setState(() {
      _currentPageIndex--; 
      widget.id = int.parse(widget.items[_currentPageIndex]['id']);
      print(widget.id);
       _pageController.jumpToPage(_currentPageIndex); // Synchronize the PageController
      updateImageAndName();
      // print('hello');
    });
    // fetchData(currentItemId);
  }
}
@override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideBar(),
        appBar: reusableappbar(context, (){_scaffoldKey.currentState!.openDrawer();},''),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFe5af55),
                Color(0xFFe3e18e),
              ],
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: PageView.builder(
          controller: _pageController,
          itemCount: widget.items.length,
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
              widget.id = int.parse(widget.items[index]['id']);
              updateImageAndName();
            });
          },
          itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02),
                      width: MediaQuery.of(context).size.width * .8,
                      height: MediaQuery.of(context).size.height * .32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white),
                          child: 
                          CachedNetworkImage(imageUrl: '${currentImageUrl}',
                                errorWidget: (context, url, error) => Image.asset('assets/placeholder_not_found.png'),
                                width: double.infinity,
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.high,
                                placeholder: (context, url) => Image.asset('assets/placeholder_loading.png'),
                                ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                        // Consumer<TextVisibilityProvider>(builder: (context, textVisibilityProvider, child) {
                        //     return Container(
                        //       width: MediaQuery.of(context).size.width * .1,
                        //       child: reusablenextitembtn(context, (){
                        //       //how to move to next item
                        //       print(
                        //         widget.current
                        //       );
                        //       moveToPreviousItem();
                        //       setState(() {});
                        //       String voiceUrl;
                        //       if (textVisibilityProvider .isFirstTextVisible) {
                        //         voiceUrl = '${currentVoiceAr}';
                        //       } else if (textVisibilityProvider .isThirdTextVisible) {
                        //         voiceUrl = '${currentVoiceUr}';
                        //       } else if (textVisibilityProvider .isForTextVisible) {
                        //         voiceUrl = '${currentVoiceTur}';
                        //       } else if (textVisibilityProvider .isFiveTextVisible) {
                        //         voiceUrl = '${currentVoiceChi}';
                        //       } else if (textVisibilityProvider .isSixTextVisible) {
                        //         voiceUrl = '${currentVoicePas}';
                        //       } else {
                        //         voiceUrl = '${currentVoiceEng}';
                        //       }
                        //       // playAudioFromUrl('${item['english_voice']}');
                        //       playAudioFromUrl(voiceUrl);
                        //       setState(() {});
                        //                                 },'assets/back_blue.png'),
                        //     );
                        //   },),


                        Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01),
                      width: MediaQuery.of(context).size.width * .8,
                      height: MediaQuery.of(context).size.height * .43,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            reusableitemdetailsrow('${currentNameAr}', Color(0xFF17a493),
                                const Color.fromARGB(255, 51, 219, 177), context,(){
                                  playAudioFromUrl(currentVoiceAr);
                                }),
                            reusableitemdetailsrow('${currentNameEng[0].toString().toUpperCase() + currentNameEng.substring(1).toLowerCase()}', Color(0xFF9753fe),
                                Color.fromARGB(255, 161, 136, 204), context,(){
                                  playAudioFromUrl(currentVoiceEng);
                                }),
                            reusableitemdetailsrow('${currentNameUr.toString().toUpperCase()}', Color(0xFF4e59ff),
                                Color(0xFF5d80fe), context,(){
                                  playAudioFromUrl(currentVoiceUr);
                                }),
                            reusableitemdetailsrow('${currentNameTur[0].toString().toUpperCase()+ currentNameTur.substring(1).toLowerCase()}', Color(0xFFe14abe),
                                Colors.pink.shade200, context,(){
                                  playAudioFromUrl(currentVoiceTur);
                                }),
                                reusableitemdetailsrow('${currentNameChi.toString().toUpperCase()}', colorController.chineseTextBtnColor,
                                const Color(0xFFac6c84), context,(){
                                  playAudioFromUrl(currentVoiceChi);
                                }),
                            reusableitemdetailsrow('${currentNamePas.toString().toUpperCase()}', colorController.pashtoTextBtnColor,
                                const Color(0xFFbcc494), context,(){
                                  playAudioFromUrl(currentVoicePas);
                                }),
                          ],
                        ),
                      ),
                    ),
                    //  Consumer<TextVisibilityProvider>(builder: (context, textVisibilityProvider, child) {
                    //         return Container(
                    //           width: MediaQuery.of(context).size.width * .1,
                    //           child: reusablenextitembtn(context, (){
                    //           //how to move to next item
                    //           print(
                    //             widget.current
                    //           );
                    //           moveToNextItem();
                    //           setState(() {});
                    //           String voiceUrl;
                    //           if (textVisibilityProvider .isFirstTextVisible) {
                    //             voiceUrl = '${currentVoiceAr}';
                    //           } else if (textVisibilityProvider .isThirdTextVisible) {
                    //             voiceUrl = '${currentVoiceUr}';
                    //           } else if (textVisibilityProvider .isForTextVisible) {
                    //             voiceUrl = '${currentVoiceTur}';
                    //           } else if (textVisibilityProvider .isFiveTextVisible) {
                    //             voiceUrl = '${currentVoiceChi}';
                    //           } else if (textVisibilityProvider .isSixTextVisible) {
                    //             voiceUrl = '${currentVoicePas}';
                    //           } else {
                    //             voiceUrl = '${currentVoiceEng}';
                    //           }
                    //           // playAudioFromUrl('${item['english_voice']}');
                    //           playAudioFromUrl(voiceUrl);
                    //           setState(() {});
                    //                                     },'assets/next_blue.png'),
                    //         );
                    //       },),
                    //   ],
                    // ),

                    // Container(
                    //   margin: EdgeInsets.only(
                    //       top: MediaQuery.of(context).size.height * 0.005),
                    //   width: MediaQuery.of(context).size.width * .76,
                    //   height: MediaQuery.of(context).size.height * .05,
                    //   alignment: Alignment.center,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(16),
                    //       color: Colors.transparent),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Center(
                    //         child: Text('${_currentPageIndex + 1}/${widget.items.length}',style: TextStyle(color: Color(0xFFaf2307)),),
                    //       ),
                    //       // Center(
                    //       //   child: Text('Swipe>>',style: TextStyle(color: Color(0xFFaf2307)),),
                    //       // ),
                    //     ],
                    //   )
                    // ),

                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.015),
                      width: MediaQuery.of(context).size.width * .76,
                      height: MediaQuery.of(context).size.height * .07,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.transparent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Consumer<TextVisibilityProvider>(builder: (context, textVisibilityProvider, child) {
                            return reusablenextitembtn(context, (){
                            //how to move to next item
                            print(
                              widget.current
                            );
                            moveToPreviousItem();
                            setState(() {});
                            String voiceUrl;
                            if (textVisibilityProvider .isFirstTextVisible) {
                              voiceUrl = '${currentVoiceAr}';
                            } else if (textVisibilityProvider .isThirdTextVisible) {
                              voiceUrl = '${currentVoiceUr}';
                            } else if (textVisibilityProvider .isForTextVisible) {
                              voiceUrl = '${currentVoiceTur}';
                            } else if (textVisibilityProvider .isFiveTextVisible) {
                              voiceUrl = '${currentVoiceChi}';
                            } else if (textVisibilityProvider .isSixTextVisible) {
                              voiceUrl = '${currentVoicePas}';
                            } else {
                              voiceUrl = '${currentVoiceEng}';
                            }
                            // playAudioFromUrl('${item['english_voice']}');
                            playAudioFromUrl(voiceUrl);
                            setState(() {});
                          },'assets/back_blue.png');
                          },),
                          
                          // Text('${widget.current + 1}/${widget.items.length}',style: TextStyle(color: Color(0xFFaf2307)),),
                          Text('${_currentPageIndex + 1}/${widget.items.length}',style: TextStyle(color: Color(0xFFaf2307)),),
                          Consumer<TextVisibilityProvider>(builder: (context, textVisibilityProvider, child) {
                            return reusablenextitembtn(context, (){
                            //how to move to next item
                            print(
                              widget.current
                            );
                            moveToNextItem();
                            setState(() {});
                            String voiceUrl;
                            if (textVisibilityProvider .isFirstTextVisible) {
                              voiceUrl = '${currentVoiceAr}';
                            } else if (textVisibilityProvider .isThirdTextVisible) {
                              voiceUrl = '${currentVoiceUr}';
                            } else if (textVisibilityProvider .isForTextVisible) {
                              voiceUrl = '${currentVoiceTur}';
                            } else if (textVisibilityProvider .isFiveTextVisible) {
                              voiceUrl = '${currentVoiceChi}';
                            } else if (textVisibilityProvider .isSixTextVisible) {
                              voiceUrl = '${currentVoicePas}';
                            } else {
                              voiceUrl = '${currentVoiceEng}';
                            }
                            // playAudioFromUrl('${item['english_voice']}');
                            playAudioFromUrl(voiceUrl);
                            setState(() {});
                          },'assets/next_blue.png');
                          },),
                          // reusablenextitembtn(context, (){
                          //   print(
                          //     widget.current
                          //   );
                          //   //how to move to back item
                          //   moveToNextItem();
                          // },'assets/next_blue.png'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ));
  }
}
