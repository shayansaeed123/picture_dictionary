import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/res/reusableappbar.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({super.key});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
          appBar: reusableappbar(context, () {}, 'Search Item'),
          body: Container(
            
            decoration: BoxDecoration(
              // backgroundBlendMode:  BlendMode.multiply,
              image: DecorationImage(
                image: AssetImage('assets/second_page.png'),
                fit:  BoxFit.cover,
              ),
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: [
              //     // eb8815 f5d12d
              //     colorController.bgColorup,
              //     colorController.bgColordown,
              //   ],
              // ),
            ),
            // width: MediaQuery.of(context).size.width,
            // height: double.infinity,
            child: Column(
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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child: Text('Type to Search', style: TextStyle(fontSize: 25),)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Enter any category in your prefered language to search', style: TextStyle(fontSize: 16),),
                      ),
                  ],),
                )
              ],
            ),
          )),
    );
  }
}
