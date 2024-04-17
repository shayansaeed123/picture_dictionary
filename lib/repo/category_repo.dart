import 'package:http/http.dart' as http;
import 'dart:convert';

class PictureRepo{


  Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await http.get(Uri.parse('https://kulyatudawah.com/public/vocgame/apis/get_types.php'));

    if (response.statusCode == 200) {
      dynamic jsonResponse = jsonDecode(response.body);
      List<Map<String, dynamic>> listResponse = jsonResponse['types'].cast<Map<String, dynamic>>();
      print(listResponse);

      return listResponse;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Map<String, dynamic>>> fetchItemsByCategory(String category) async {
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

      return items;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<String>> fetchCategories() async {
    final response = await http.get(Uri.parse('https://kulyatudawah.com/public/vocgame/apis/get_types.php'));

    if (response.statusCode == 200) {
      dynamic jsonResponse = jsonDecode(response.body);
      List<String> categories = jsonResponse['types']
          .map<String>((type) => type['english'] as String)
          .toList();
      return categories;
    } else {
      throw Exception('Failed to load data');
    }
  }

}