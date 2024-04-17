import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/res/reusableappbar.dart';
import 'package:picture_dictionary/view/dashboard/itemdetails.dart';
import 'package:picture_dictionary/widget/sidebar.dart';
import 'package:http/http.dart' as http;

class ItemsPage extends StatefulWidget {
  // final VoidCallback fetchDataCallback;
  // final List<String> categories;
  final Future<List<String>> categoriesFuture;
  final Future<List<Map<String, dynamic>>> itemsFuture;
  const ItemsPage({super.key, required this.categoriesFuture, required this.itemsFuture});
 
  //  required this.fetchDataCallback, required this.categories

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // // late Future<List<dynamic>> _data;
  // List<Map<String, dynamic>> _data = [];
  // // List<itemModel> filteredItems = [];
  // bool _isLoading = false;

  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }
  // Future<void> fetchData() async {
  //   // setState(() {
  //   //   _isLoading = true;
  //   // });

  //   final response = await http.get(Uri.parse('https://kulyatudawah.com/public/vocgame/apis/get_items.php'));

  //   if (response.statusCode == 200) {
  //     final List<Map<String, dynamic>> responseData = jsonDecode(response.body).cast<Map<String, dynamic>>();

  //     setState(() {
  //       _data = responseData;
  //       _isLoading = false;
  //       print('helooooo ${_data}');
  //     });
  //   } else {
  //     // Handle error
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     print('Failed to fetch data. Error: ${response.reasonPhrase}');
  //   }
  // }


  // List<Map<String, dynamic>> filterDataByCategory(String category) {
  //    print('helooooo22222222 ${_data}');
  //   return _data.where((item) => item['type_id'] == category).toList();
  // }
  // // void filterDataByCategory(String category) {
  // //    print('helooooo22222222 ${_data}');
  // //   filteredItems = _data.where((item) => item['type_id'] == category).toList();
  // // }
  

  // // Future<List<dynamic>> fetchData() async {
  // //   final response =
  // //       await http.get(Uri.parse('https://kulyatudawah.com/public/vocgame/apis/get_items.php'));
  // //   if (response.statusCode == 200) {
  // //     print('Shayannnn Iteemmmmmmmm ${response.body}');
  // //     return json.decode(response.body);
  // //   } else {
  // //     throw Exception('Failed to load data');
  // //   }
  // // }
  
  
  
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       key: _scaffoldKey,
  //       appBar: reusableappbar(context, (){_scaffoldKey.currentState!.openDrawer();}, 'Categories Name'),
  //       drawer: SideBar(categories: widget.categories,fetchDataCallback: widget.fetchDataCallback,),
  //       body: Container(
  //         decoration: BoxDecoration(
  //           gradient: LinearGradient(
  //             begin: Alignment.topCenter,
  //             end: Alignment.bottomCenter,
  //             colors: [
  //              colorController.bgColorup,
  //                 colorController.bgColordown,
  //             ],
  //           ),
  //         ),
  //         width: MediaQuery.of(context).size.width,
  //         height: MediaQuery.of(context).size.height,
  //         child: 
  //         // FutureBuilder(future: fetchData(), builder: (context, snapshot) {
  //         //    if(snapshot.connectionState == ConnectionState.waiting){
  //         //     return CircularProgressIndicator();
  //         //    }else if(!snapshot.hasData){
  //         //     return Center(child: Text('data'));
  //         //    }else{
  //         //     return 
  //             GridView.builder(
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //               crossAxisCount: 2, mainAxisSpacing: 10),
  //               itemCount: filterDataByCategory('items').length,
                
  //           itemBuilder: (context, index) {
  //             // var item = snapshot.data![index];
  //             final name = filterDataByCategory('items')[index]['english'];
  //             final img = filterDataByCategory('items')[index]['image'];
  //             return Stack(
  //               children: [
  //                 Positioned(
  //                   top: MediaQuery.of(context).size.height * 0.03,
  //                   left: MediaQuery.of(context).size.width * 0.03,
  //                   right: MediaQuery.of(context).size.width * 0.03,
  //                   child: 
  //                   Transform.rotate(
  //                     angle: 45  / 180,
  //                     // 45 * 3.1415927 / 180,
  //                     child: 
  //                     Container(
  //                       width: MediaQuery.of(context).size.width * .44,
  //                       height: MediaQuery.of(context).size.height * .20,
  //                       decoration: BoxDecoration(
  //                         color: colorController.whiteColor,
  //                         // Color(0xFFffb64d),
  //                         borderRadius: BorderRadius.circular(11),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Positioned(
  //                   top: MediaQuery.of(context).size.height * 0.03,
  //                   left: MediaQuery.of(context).size.width * 0.03,
  //                   right: MediaQuery.of(context).size.width * 0.03,
  //                   child: 
  //     //               Card(
  //     //   elevation: 2.0,
  //     //   child: Column(
  //     //     crossAxisAlignment: CrossAxisAlignment.stretch,
  //     //     children: <Widget>[
  //     //       Container(
  //     //           width: MediaQuery.of(context).size.width * .44,
  //     //                 height: MediaQuery.of(context).size.height * .261,
  //     //         color: Colors.blue,
  //     //         child: Center(
  //     //           child: Text(
  //     //             'Item $index',
  //     //             style: TextStyle(color: Colors.white),
  //     //           ),
  //     //         ),
  //     //       ),
  //     //       // Padding(
  //     //       //   padding: EdgeInsets.all(8.0),
  //     //         // child: 
  //     //         ElevatedButton(
  //     //           onPressed: () {
  //     //             // Button action
  //     //           },
  //     //           child: Text('Button $index'),
  //     //         ),
  //     //       // ),
  //     //     ],
  //     //   ),
  //     // ),
  //                   InkWell(
  //                     onTap: (){
  //                       Navigator.push(context, MaterialPageRoute(builder: (_)=> ItemDetails()));
  //                     },
  //                     child: Container(
  //                       width: MediaQuery.of(context).size.width * .44,
  //                       height: MediaQuery.of(context).size.height * .20,
  //                       decoration: BoxDecoration(
  //                         color: colorController.whiteColor,
  //                         borderRadius: BorderRadius.circular(20),
  //                       ),
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         children: [
  //                           Card(
  //                             margin: EdgeInsets.all(5),
  //                             child: Image.network(
  //                               img.toString(),
  //                               height: MediaQuery.of(context).size.height * .15,
  //                               width: double.infinity,
  //                             ),
  //                             elevation: 7,
  //                             color: colorController.whiteColor,
  //                           ),
  //                           Expanded(
  //                             child: Container(
  //                               width: double.infinity,
  //                               decoration: BoxDecoration(
  //                                 color: colorController.itemsBtnColor,
  //                                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
  //                               ),
  //                               child: Center(
  //                                 child: Text(
  //                                   name.toString(),
  //                                   style: TextStyle(color: colorController.whiteColor),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             );
  //           },
  //         )
  //         // ;
  //         //    }
  //         // },)
  //       )

  //       // Container(
  //       //   decoration: BoxDecoration(
  //       //       gradient: LinearGradient(
  //       //         begin: Alignment.topCenter,
  //       //         end: Alignment.bottomCenter,
  //       //         colors: [
  //       //           // eb8815 f5d12d
  //       //           Color(0xFFe5af55),
  //       //           Color(0xFFe3e18e),
  //       //         ],
  //       //       ),
  //       //     ),
  //       //   child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
  //       //   (crossAxisCount: 2,),
  //       //   itemBuilder: (context, index) {
  //       //     return Stack(
  //       //     children: [
  //       //       Positioned(
  //       //         top: MediaQuery.of(context).size.height * 0.03,
  //       //       left: MediaQuery.of(context).size.width * 0.03,
  //       //       right: MediaQuery.of(context).size.width * 0.03,
  //       //         child: Transform.rotate(
  //       //           angle: 45 * 3.1415927 / 180,
  //       //           child: Container(
  //       //             width: MediaQuery.of(context).size.width * .40,
  //       //             height: MediaQuery.of(context).size.height * .261,
  //       //             decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(11),),
  //       //           ),
  //       //         ),
  //       //       ),
  //       //       Positioned(
  //       //         top: MediaQuery.of(context).size.height * 0.03,
  //       //       left: MediaQuery.of(context).size.width * 0.03,
  //       //       right: MediaQuery.of(context).size.width * 0.03,
  //       //         child: Container(
  //       //           width: MediaQuery.of(context).size.width * .44,
  //       //           height: MediaQuery.of(context).size.height * .261,
  //       //           decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(11),),
  //       //           child: Column(
  //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Card(
  //       //                 margin: EdgeInsets.all(5),
  //       //                 child: Image.asset('assets/log.png',height: MediaQuery.of(context).size.height * .18,width: double.infinity,),
  //       //                 elevation: 7,
  //       //               ),
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   width: double.infinity,
  //       //                   margin: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
  //       //                   // padding: EdgeInsets.all(10),
  //       //                   decoration: BoxDecoration(color: Colors.purple.shade800,borderRadius: BorderRadius.circular(8.0)),
  //       //                   child: Center(child: Text('Fruits',style: TextStyle(color: Colors.white),)),
  //       //                 ),
  //       //               )
  //       //             ],
  //       //           ),
  //       //         ),
  //       //       ),
  //       //     ],
  //       //   );
  //       //   },)
  //       // )

  //       );
  // }

  // late String selectedCategory;
  // late Future<List<String>> categoriesFuture;
  // late Future<List<Map<String, dynamic>>> itemsFuture;

  @override
  void initState() {
    super.initState();
    // selectedCategory = 'Fruits'; // Default selected category
    // categoriesFuture = fetchCategories();
    // itemsFuture = fetchItemsByCategory(selectedCategory);
  }

  // Future<List<String>> fetchCategories() async {
  //   final response = await http.get(Uri.parse('https://kulyatudawah.com/public/vocgame/apis/get_types.php'));

  //   if (response.statusCode == 200) {
  //     dynamic jsonResponse = jsonDecode(response.body);
  //     List<String> categories = jsonResponse['types']
  //         .map<String>((type) => type['english'] as String)
  //         .toList();
  //     return categories;
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  // Future<List<Map<String, dynamic>>> fetchItemsByCategory(String category) async {
  //   final response = await http.get(Uri.parse('https://kulyatudawah.com/public/vocgame/apis/get_items.php'));

  //   if (response.statusCode == 200) {
  //     dynamic jsonResponse = jsonDecode(response.body);
  //     List<Map<String, dynamic>> items = [];

  //     for (var type in jsonResponse) {
  //       if (type['type_name'] == category) {
  //         items.addAll(type['items'].cast<Map<String, dynamic>>());
  //         break;
  //       }
  //     }

  //     return items;
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Items'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // FutureBuilder<List<String>>(
          //   future: widget.categoriesFuture,
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return CircularProgressIndicator();
          //     } else if (snapshot.hasError) {
          //       return Text('Error: ${snapshot.error}');
          //     } else {
          //       List<String> categories = snapshot.data!;
          //       return DropdownButton<String>(
          //         value: selectedCategory,
          //         onChanged: (String? newValue) {
          //           setState(() {
          //             selectedCategory = newValue!;
          //             itemsFuture = fetchItemsByCategory(selectedCategory);
          //           });
          //         },
          //         items: categories
          //             .map<DropdownMenuItem<String>>((String value) {
          //           return DropdownMenuItem<String>(
          //             value: value,
          //             child: Text(value),
          //           );
          //         }).toList(),
          //       );
          //     }
          //   },
          // ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: widget.itemsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<Map<String, dynamic>> items = snapshot.data!;
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item = items[index];
                      return ListTile(
                        title: Text(item['english'] ?? '', style: TextStyle(color: Colors.black)),
                        subtitle: Text(item['urdu'] ?? '', style: TextStyle(color: Colors.black)),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  
// String selectedCategory = 'fruits'; // Default selected category
// late Future<List<Map<String, dynamic>>> itemsFuture;
  

  // @override
  // void initState() {
  //   super.initState();
  //   itemsFuture = fetchItemsByCategory(selectedCategory);
  // }

  // Future<List<Map<String, dynamic>>> fetchItemsByCategory(String category) async {
  //   final response = await http.get(Uri.parse('https://kulyatudawah.com/public/vocgame/apis/get_items.php'));

  //   if (response.statusCode == 200) {
  //     dynamic jsonResponse = jsonDecode(response.body);
  //     List<Map<String, dynamic>> items = [];

  //     for (var type in jsonResponse) {
  //       if (type['type_name'] == category) {
  //         items.addAll(type['items'].cast<Map<String, dynamic>>());
  //         break;
  //       }
  //     }

  //     return items;
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Category Items'),
  //     ),
  //     body: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         // DropdownButton<String>(
  //         //   value: selectedCategory,
  //         //   onChanged: (String? newValue) {
  //         //     setState(() {
  //         //       selectedCategory = newValue!;
  //         //       // itemsFuture = fetchItemsByCategory(selectedCategory);
  //         //     });
  //         //   },
  //         //   items: <String>['Fruits', 'Vegetables', 'Other Categories']
  //         //       .map<DropdownMenuItem<String>>((String value) {
  //         //     return DropdownMenuItem<String>(
  //         //       value: value,
  //         //       child: Text(value),
  //         //     );
  //         //   }).toList(),
  //         // ),
  //         Expanded(
  //           child: FutureBuilder<List<Map<String, dynamic>>>(
  //             future: widget.itemsFuture,
  //             builder: (context, snapshot) {
  //               if (snapshot.connectionState == ConnectionState.waiting) {
  //                 return Center(child: CircularProgressIndicator());
  //               } else if (snapshot.hasError) {
  //                 return Text('Error: ${snapshot.error}');
  //               } else {
  //                 List<Map<String, dynamic>> items = snapshot.data!;
  //                 return ListView.builder(
  //                   itemCount: items.length,
  //                   itemBuilder: (context, index) {
  //                     Map<String, dynamic> item = items[index];
  //                     return InkWell(
  //                       onTap: (){
                          
  //                       },
  //                       child: ListTile(
  //                         title: Text(item['english'] ?? '', style: TextStyle(color: Colors.black)),
  //                         subtitle: Text(item['urdu'] ?? '', style: TextStyle(color: Colors.black)),
  //                       ),
  //                     );
  //                   },
  //                 );
  //               }
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}


