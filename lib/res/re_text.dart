

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Text  reusabletext(String txt, Color clr, double txtsize,) {
  return Text(
    txt,
    style:
        TextStyle(color: clr, fontWeight: FontWeight.bold, fontSize: txtsize),
  );
}

class spinkits{

  SpinKitWave spinKit = SpinKitWave(
  color: Colors.black,
  size: 25,
);
}