import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:picture_dictionary/res/reusableitemdetailsrow.dart';
import 'package:picture_dictionary/res/reusablenextitembtn.dart';
import 'package:picture_dictionary/widget/sidebar.dart';

class ItemDetails extends StatefulWidget {
  String ar_voice ,ur_voice , en_voice, tr_voice , ar_name , ur_name , en_name , tr_name , img;
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
  });

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
                        reusableitemdetailsrow('${widget.ar_name.toString().toUpperCase()}', Color(0xFF17a493),
                            const Color.fromARGB(255, 51, 219, 177), context),
                        reusableitemdetailsrow('${widget.en_name.toString().toUpperCase()}', Color(0xFF9753fe),
                            Color.fromARGB(255, 161, 136, 204), context),
                        reusableitemdetailsrow('${widget.ur_name.toString().toUpperCase()}', Color.fromARGB(255, 34, 37, 87),
                            Colors.blue.shade500, context),
                        reusableitemdetailsrow('${widget.tr_name.toString().toUpperCase()}', Color(0xFFe14abe),
                            Colors.pink.shade200, context),
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
                      reusablenextitembtn(context, (){}),
                      Text('1/12',style: TextStyle(color: Color(0xFFaf2307)),),
                      reusablenextitembtn(context, (){},icon: Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
