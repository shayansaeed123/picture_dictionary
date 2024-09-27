import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Define a model class for the items
class FruitItem {
  final String id;
  final String english;
  final String englishVoice;
  final String turkish;
  final String turkishVoice;
  final String urdu;
  final String urduVoice;
  final String arabic;
  final String arabicVoice;
  final String typeId;
  final String type;
  final String image;

  FruitItem({
    required this.id,
    required this.english,
    required this.englishVoice,
    required this.turkish,
    required this.turkishVoice,
    required this.urdu,
    required this.urduVoice,
    required this.arabic,
    required this.arabicVoice,
    required this.typeId,
    required this.type,
    required this.image,
  });

  factory FruitItem.fromJson(Map<String, dynamic> json) {
    return FruitItem(
      id: json['id'],
      english: json['english'],
      englishVoice: json['english_voice'],
      turkish: json['turkish'],
      turkishVoice: json['turkish_voice'],
      urdu: json['urdu'],
      urduVoice: json['urdu_voice'],
      arabic: json['arabic'],
      arabicVoice: json['arabic_voice'],
      typeId: json['type_id'],
      type: json['type'],
      image: json['image'],
    );
  }
}