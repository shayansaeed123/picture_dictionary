import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // eb8815 f5d12d
                  Color(0xFFe5af55),
                  Color(0xFFe3e18e),
                ],
              ),
            ),
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
                  child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF56acdd),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      hintText: 'search',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: Color(0xFF67c9f2), width: 4)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: Color(0xFF67c9f2), width: 4)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: Color(0xFF67c9f2), width: 4)),
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
