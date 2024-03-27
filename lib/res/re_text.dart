

import 'dart:ui';

import 'package:flutter/material.dart';

Text  reusabletext(String txt, Color clr, double txtsize) {
  return Text(
    txt,
    style:
        TextStyle(color: clr, fontWeight: FontWeight.bold, fontSize: txtsize),
  );
}