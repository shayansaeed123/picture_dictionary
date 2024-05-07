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

   

}