import 'dart:convert';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/repo/category_repo.dart';
import 'package:picture_dictionary/res/reusableloading.dart';
import 'package:http/http.dart' as http;

class GamePageThree extends StatefulWidget {
  final String selectedCategory;
  final Future<List<Map<String, dynamic>>> itemsFuture;
  const GamePageThree({Key? key,required this.selectedCategory, required this.itemsFuture}) : super(key: key);

  @override
  State<GamePageThree> createState() => _GamePageThreeState();
}

class _GamePageThreeState extends State<GamePageThree> {
  late Future<List<Map<String, dynamic>>> _itemsFuture;

  @override
  void initState() {
    super.initState();
    _itemsFuture = widget.itemsFuture;
  }
  // String userid = '';

  // bool isLogin() {
  //   final auth = FirebaseAuth.instance;
  //   final user = auth.currentUser;
    
  //   // String userid = user!.uid.toString();
  //   // print('User Id $userid');
  //   if (user != null) {
  //     userid = user.uid.toString();
  //     print('User Id $userid');
  //     return true;
  //   }
  //   userid = '101';
  //   return false;
  // }

  // Future<String> questionApi()async{
  //   final response = await http.post(
  //     Uri.parse('https://kulyatudawah.com/public/vocgame/apis/add_question_answers_status.php'),
  //     body: {
  //       'user_id': userid.toString(),
  //       'type_id': widget.selectedCategory.toString(),
  //       'item_id_question': 
  //       // MySharedPrefrence().get_cat_id(),
  //     },
  //   );
  //  }


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: _itemsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: reusableloadingrow(context, true));
                } else if (!snapshot.hasData) {
                  return Center(child: Text('No data'));
                } else {
                  List<Map<String, dynamic>> items =
                      snapshot.data as List<Map<String, dynamic>>;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                      ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item = items[index];
                      return 
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(MediaQuery.of(context).size.width * .07),
                              child: Card(
                                color: colorController.whiteColor,
                                elevation: 0,
                                child: Center(child: Image.network(item['image'],height: 150,width: 150,))),
                            ));
                       
                    },
                  );
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: _refreshItems,
            child: Text('Refresh'),
          ),
        ],
      ),
    );
  }

  Future<void> _refreshItems() async {
    setState(() {
      _itemsFuture = fetchGameCategories(widget.selectedCategory);
    });
  }




  Future<List<Map<String, dynamic>>> fetchGameCategories(String categoryId) async {
  try {
    final response = await http.post(
      Uri.parse('https://kulyatudawah.com/public/vocgame/apis/get_limited_items.php'),
      body: {
        'type_id': widget.selectedCategory.toString(),
        // MySharedPrefrence().get_cat_id(),
      },
    );
setState(() {});
    print('ID1 ${widget.selectedCategory}');
setState(() {});
    if (response.statusCode == 200) {
      dynamic jsonResponse = jsonDecode(response.body);
      List<Map<String, dynamic>> items = [];
      for (var type in jsonResponse) {
        setState(() {});
          print('ID2 ${categoryId}');
        if (type['type_id'] == categoryId) { // Convert type_id to String
          items.addAll(type['items'].cast<Map<String, dynamic>>());
          print('Added items: $items');
          break;
        }
      }
      print('Game All Items $items');
      
      return items;
    } else {
      throw Exception('failed to load data');
    }
  } catch (e) {
    print('Error: $e');
    throw Exception('failed to load data');
  } finally {
    // _isLoading = false;
  }
   }
}
