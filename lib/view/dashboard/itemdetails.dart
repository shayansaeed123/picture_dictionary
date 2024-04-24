import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:picture_dictionary/res/reusableitemdetailsrow.dart';
import 'package:picture_dictionary/res/reusablenextitembtn.dart';
import 'package:picture_dictionary/widget/sidebar.dart';

class ItemDetails extends StatefulWidget {
  String ar_voice ,ur_voice , en_voice, tr_voice , ar_name , ur_name , en_name , tr_name , img;
  int current;
  List<Map<String, dynamic>> items;
   ItemDetails({super.key, 
  required this.ar_voice, 
  required this.ur_voice,
  required this.en_voice, 
  required this.tr_voice,
  required this.ar_name, 
  required this.ur_name,
  required this.en_name, 
  required this.tr_name,
  required this.img, 
  required this.items,
  required this.current,
  });

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AudioPlayer audioPlayer = AudioPlayer();
  Future<void> playAudioFromUrl(String url) async {
    await audioPlayer.play(UrlSource(url));
    if(url == 1){
      print('succes');
    }else{
      print('fail');
    }
  }

  




void moveToNextItem() {
  if (widget.current < widget.items.length ) {
    setState(() {
      widget.current++; // Move to the next ID
    });
    // Fetch data for the new ID from the API
    // fetchData(currentItemId);
  }
}

void moveToPreviousItem() {
  if (widget.current > 0) {
    setState(() {
      widget.current--; 
      // print('hello');
    });

    // fetchData(currentItemId);
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideBar(),
        appBar: reusableappbar(context, (){_scaffoldKey.currentState!.openDrawer();},'${widget.en_name.toString().toUpperCase()}'),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  width: MediaQuery.of(context).size.width * .76,
                  height: MediaQuery.of(context).size.height * .42,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white),
                      child: 
                      CachedNetworkImage(imageUrl: '${widget.img}',
                            errorWidget: (context, url, error) => Image.asset('assets/placeholder_not_found.png'),
                            width: double.infinity,
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high,
                            placeholder: (context, url) => Image.asset('assets/placeholder_loading.png'),
                            ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  width: MediaQuery.of(context).size.width * .76,
                  height: MediaQuery.of(context).size.height * .28,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        reusableitemdetailsrow('${widget.ar_name}', Color(0xFF17a493),
                            const Color.fromARGB(255, 51, 219, 177), context,(){
                              playAudioFromUrl(widget.ar_voice);
                            }),
                        reusableitemdetailsrow('${widget.en_name.toString().toUpperCase()}', Color(0xFF9753fe),
                            Color.fromARGB(255, 161, 136, 204), context,(){
                              playAudioFromUrl(widget.en_voice);
                            }),
                        reusableitemdetailsrow('${widget.ur_name.toString().toUpperCase()}', Color(0xFF4e59ff),
                            Color(0xFF5d80fe), context,(){
                              playAudioFromUrl(widget.ur_voice);
                            }),
                        reusableitemdetailsrow('${widget.tr_name.toString().toUpperCase()}', Color(0xFFe14abe),
                            Colors.pink.shade200, context,(){
                              playAudioFromUrl(widget.tr_voice);
                            }),
                      ],
                    ),
                  ),
                ),
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
                      reusablenextitembtn(context, (){
                        //how to move to next item
                        print(
                          widget.current
                        );
                        moveToPreviousItem();
                      },'assets/back_blue.png'),
                      
                      Text('${widget.current + 1}/${widget.items.length}',style: TextStyle(color: Color(0xFFaf2307)),),
                      reusablenextitembtn(context, (){
                        print(
                          widget.current
                        );
                        //how to move to back item
                        moveToNextItem();
                      },'assets/next_blue.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
