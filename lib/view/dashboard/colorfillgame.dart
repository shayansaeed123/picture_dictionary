


import 'dart:ui' as ui;

import 'package:floodfill_image/floodfill_image.dart';
import 'package:flutter/material.dart';

class ColoredFillGame extends StatefulWidget {
  const ColoredFillGame({super.key});

  @override
  State<ColoredFillGame> createState() => _ColoredFillGameState();
}

class _ColoredFillGameState extends State<ColoredFillGame> {
  int currentRound = 1;        // موجودہ راونڈ (1 سے شروع ہو کر 100 تک)
  int score = 0;              // مجموعی اسکور
  int imageIndex = 0;         // کتنی تصاویر میں سے کونسا چل رہا ہے
  Color? selectedColor;       // صارف کی منتخب کردہ رنگ
  late List<bool> regionFilled; // ٹریک کرے گا کہ کون سے حصے بھردیے گئے ہیں

  // تصاویر کا ڈیٹا: ہر تصویر کے لیے asset path اور حصوں کے صحیح رنگ
  final List<Map<String, dynamic>> imagesData = [
    {
      'path': 'assets/cat.jpg',
      'regions': [
        { 'color': Colors.red, 'name': 'Region 1' },
        { 'color': Colors.green, 'name': 'Region 2' },
      ],
    },
    {
      'path': 'assets/cat.jpg',
      'regions': [
        { 'color': Colors.yellow, 'name': 'Region 1' },
        { 'color': Colors.brown, 'name': 'Region 2' },
      ],
    },
    {
      'path': 'assets/cat.jpg',
      'regions': [
        { 'color': Colors.orange, 'name': 'Region 1' },
        { 'color': Colors.blue, 'name': 'Region 2' },
      ],
    },
  ];

  // یوزر کے لیے رنگوں کا پیلیٹ (ColorPalette)
  final List<Color> paletteColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.brown,
  ];

  @override
  void initState() {
    super.initState();
    // پہلی تصویر کے حصوں کے لیے 'filled' سٹیٹس کو false سیٹ کریں
    regionFilled = List.filled(
      imagesData[imageIndex]['regions'].length, false
    );
  }

  // اگلے راونڈ پر جانے کا فنکشن
  void nextRound() {
    setState(() {
      currentRound++;
      if (currentRound <= 100) {
        // اگر 100 راونڈ مکمل نہ ہوئے تو اگلی تصویر لوڈ کریں
        imageIndex = (imageIndex + 1) % imagesData.length;
        // نئے راونڈ کے حصوں کو ری سیٹ کریں
        regionFilled = List.filled(
          imagesData[imageIndex]['regions'].length, false
        );
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
    // موجودہ تصویر کا path اور اس کے حصے
    final currentImage = imagesData[imageIndex]['path'];
    final currentRegions = imagesData[imageIndex]['regions'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Color Fill Game'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // اسکور اور راونڈ دکھائیں
            Text('Round: $currentRound/100', style: TextStyle(fontSize: 20)),
            Text('Score: $score', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            // رنگوں کا پیلیٹ (Palette)؛ جس رنگ پر کلک ہوگا وہ منتخب ہوجائے گا
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: paletteColors.map((color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = color;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(4),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color,
                      border: Border.all(
                        // منتخب رنگ پر کالر کے چاروں طرف بلیک بارڈر لگائیں
                        color: selectedColor == color ? Colors.black : Colors.white,
                        width: 3,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            // FloodFillImage ویجٹ تصویر دکھانے اور ٹچ بھرتے لیے
            Expanded(
              child: Center(
                child: FloodFillImage(
  // تصویر لوڈ کرنے کے لیے AssetImage دیں
  imageProvider: AssetImage(currentImage),

  // بھرتے جانے والا منتخب رنگ (Flood fill color)
  fillColor: selectedColor ?? Colors.transparent,

  // ان رنگوں سے فلڈ فل نہیں ہوگا (شفاف اور بلیک بارڈر)
  avoidColor: [Colors.transparent, Colors.black],

  // اگر کوئی رنگ منتخب نہ ہوا ہو تو فلڈ فل کو disable کر دیں
  isFillActive: selectedColor != null,

  // جب صارف تصویر پر ٹچ کرے تو کال بیک
  onFloodFillStart: (Offset tapPos, ui.Image image) {  // ← dart:ui.Image
  if (selectedColor == null) return; // void function, no return
  final double half = image.width / 2;
  final int regionIndex = (tapPos.dx < half) ? 0 : 1;
  final Color expectedColor = currentRegions[regionIndex]['color'];

  if (selectedColor == expectedColor && !regionFilled[regionIndex]) {
    setState(() {
      regionFilled[regionIndex] = true;
      score += 1;
    });
    if (regionFilled.every((filled) => filled)) nextRound();
  } else {
    setState(() {
      regionFilled = List.filled(regionFilled.length, false);
    });
  }
},



)

              ),
            ),
          ],
        ),
      ),
    );
  }
}