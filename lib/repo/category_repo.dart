import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:picture_dictionary/common/MySharedPrefrence.dart';
import 'dart:convert';

import 'package:picture_dictionary/res/reusabledailog.dart';

class PictureRepo{
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  late BuildContext context;
  Future<List<Map<String, dynamic>>> fetchData() async {
    _isLoading = true;
   try{
    _isLoading = false;
     final response = await http.get(Uri.parse('https://kulyatudawah.com/public/vocgame/apis/get_types.php'));

    if (response.statusCode == 200) {
      dynamic jsonResponse = jsonDecode(response.body);
      List<Map<String, dynamic>> listResponse = jsonResponse['types'].cast<Map<String, dynamic>>();
      print(listResponse);

      return listResponse;
    } else {
      return reusabledialog(context, "Error",
            "Please check your internet connection", "Ok", () {});
    }
   }catch(e){
    print('Error : $e');
    return
    //  SocketException(
      reusabledialog(context, "Error",
            "Please check your internet connection", "Ok", () {});
    
   }finally{
      _isLoading = false;
   }
  }

  Future<List<Map<String, dynamic>>> fetchItemsByCategory(String category) async {
    _isLoading = true;
    try{
      _isLoading = false;
      final response = await http.get(Uri.parse('https://kulyatudawah.com/public/vocgame/apis/get_items.php'));

    if (response.statusCode == 200) {
      dynamic jsonResponse = jsonDecode(response.body);
      List<Map<String, dynamic>> items = [];

      for (var type in jsonResponse) {
        if (type['type_name'] == category) {
          items.addAll(type['items'].cast<Map<String, dynamic>>());
          break;
        }
      }
      print('All items $items ');
      return items;
    } else {
      return reusabledialog(context, "Error",
            "Please check your internet connection", "Ok", () {});
    }
    }catch(e){
      print(e.toString());
      return reusabledialog(context, "Error",
            "Please check your internet connection", "Ok", () {});
    }finally{
      _isLoading = false;
    }
  }

  Future<List<String>> fetchCategories() async {
    _isLoading = true;
    try{
      _isLoading = false;
      final response = await http.get(Uri.parse('https://kulyatudawah.com/public/vocgame/apis/get_types.php'));

    if (response.statusCode == 200) {
      dynamic jsonResponse = jsonDecode(response.body);
      List<String> categories = jsonResponse['types']
          .map<String>((type) => type['english'] as String)
          .toList();
      return categories;
    } else {
      return reusabledialog(context, "Error",
            "Please check your internet connection", "Ok", () {});
    }
  }catch(e){
    print(e.toString());
    return reusabledialog(context, "Error",
            "Please check your internet connection", "Ok", () {});
  }finally{
    _isLoading = false;
  }
    }

    final AudioPlayer audioPlayer = AudioPlayer();
  Future<void> playAudioFromUrl(String url) async {
    await audioPlayer.play(UrlSource(url));
    if(url == 1){
      print('succes');
    }else{
      print('fail');
    }
  }

   Future<List<Map<String, dynamic>>> fetchGameCategories(String categoryId) async {

//     final apiUrl = 'https://eleprogram.turk.pk/api/assignment1.php';
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
        // body: {
        //   'type_id':  MySharedPrefrence().get_cat_id().toString(),
        //   },
//       );

//       if (response.statusCode == 200) {
//         final List<Map<String, dynamic>> data =
//             json.decode(response.body).cast<Map<String, dynamic>>();
//         print(data);
//   return 
//  data;
//       }
//        else {
//         throw Exception('Failed to load data from API');
//       }
//     } catch (e) {
//       throw Exception('Error fetching data: $e');
//     }
//   }

_isLoading = true;
  try {
    _isLoading = false;
    print('myshared ${MySharedPrefrence().get_cat_id()}');
    final response = await http.post(
      Uri.parse('https://kulyatudawah.com/public/vocgame/apis/get_limited_items.php'),
      body: {
        'type_id': MySharedPrefrence().get_cat_id(),
      },
    );

    print('myshared1 ${MySharedPrefrence().get_cat_id()}');
    categoryId == MySharedPrefrence().get_cat_id();

print("cat_ id $categoryId");
    if (response.statusCode == 200) {
      dynamic jsonResponse = jsonDecode(response.body);
      List<Map<String, dynamic>> items = [];

      for (var type in jsonResponse) {
        print('hello');
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
    _isLoading = false;
  }
   }

}