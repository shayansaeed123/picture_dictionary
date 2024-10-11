import 'package:flutter/cupertino.dart';

class MatchWordGameTwo extends StatefulWidget {
  final String selectedCategory;
  final Future<List<Map<String, dynamic>>> itemsFuture;
  final Future<Map<String, dynamic>> itemsFuture2;
  const MatchWordGameTwo({Key? key,required this.selectedCategory, required this.itemsFuture,
  required this.itemsFuture2
  }) : super(key: key);

  @override
  State<MatchWordGameTwo> createState() => _MatchWordGameTwoState();
}

class _MatchWordGameTwoState extends State<MatchWordGameTwo> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}