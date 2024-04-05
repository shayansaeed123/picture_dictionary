import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:picture_dictionary/res/re_text.dart';
import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:picture_dictionary/view/dashboard/items.dart';
import 'package:picture_dictionary/widget/sidebar.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> item = [];
  late int id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<dynamic> fetchData() async {
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
      return data;
    } else {
      // Handle API error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        // backgroundColor: Color(0xFFffb64d),
        appBar: reusableappbar(context, () {
          _scaffoldKey.currentState!.openDrawer();
        }, 'Categories'),
        drawer: SideBar(),
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
                            builder: (context) => ItemsPage(),
                          ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(10),
                        child:  Container(
                  width: MediaQuery.of(context).size.width * .44,
                  height: MediaQuery.of(context).size.height * .361,
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(11),),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CachedNetworkImage(imageUrl: type['image'],
                        errorWidget: (context, url, error) => Icon(Icons.error_outline),
                        width: double.infinity,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                        placeholder: (context, url) => spinkits().spinKit,
                        )
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height*0.05,
                        margin: EdgeInsets.all(MediaQuery.of(context).size.height * .001),
                        padding: EdgeInsets.all(MediaQuery.of(context).size.height * .003),
                        decoration: BoxDecoration(color: Colors.purple.shade800,borderRadius: BorderRadius.circular(8.0)),
                        child: Center(child: Text(type['english'],style: TextStyle(color: Colors.white),)),
                      )
                    ],
                  ),
                ),
                      ),
                    );
                  },
                ),
          ),
          
          // child: Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Padding(
          //       padding:  EdgeInsets.all(MediaQuery.of(context).size.height * .01),
          //       child:
                // Container(
                //   width: MediaQuery.of(context).size.width * .44,
                //   height: MediaQuery.of(context).size.height * .261,
                //   decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(11),),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Card(
                //         margin: EdgeInsets.all(5),
                //         child: Image.asset('assets/log.png',height: MediaQuery.of(context).size.height * .18,width: double.infinity,),
                //         elevation: 7,
                //       ),
                //       Expanded(
                //         child: InkWell(
                //           onTap: (){
                //     Navigator.push(context, MaterialPageRoute(builder: (context) => ItemsPage(),));
                //   },
                //           child: Container(
                //             width: double.infinity,
                //             // height: MediaQuery.of(context).size.height*0.05,
                //             margin: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
                //             // padding: EdgeInsets.all(10),
                //             decoration: BoxDecoration(color: Colors.purple.shade800,borderRadius: BorderRadius.circular(8.0)),
                //             child: Center(child: Text('Fruits',style: TextStyle(color: Colors.white),)),
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
          //       child: Container(
          //         width: MediaQuery.of(context).size.width * .44,
          //         height: MediaQuery.of(context).size.height * .261,
          //         decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(11),),
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Card(
          //               margin: EdgeInsets.all(5),
          //               child: Image.asset('assets/log.png',height: MediaQuery.of(context).size.height * .18,width: double.infinity,),
          //               elevation: 7,
          //             ),
          //             Expanded(
          //               child: Container(
          //                 width: double.infinity,
          //                 // height: MediaQuery.of(context).size.height*0.05,
          //                 margin: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
          //                 // padding: EdgeInsets.all(MediaQuery.of(context).size.height * .02),
          //                 decoration: BoxDecoration(color: Colors.purple.shade800,borderRadius: BorderRadius.circular(8.0)),
          //                 child: Center(child: Text('Fruits',style: TextStyle(color: Colors.white),)),

          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ));
  }
}
