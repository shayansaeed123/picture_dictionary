import 'package:flutter/material.dart';

class TextVisibilityProvider with ChangeNotifier {
  bool isFirstTextVisible = false;
  bool isSecondTextVisible = false;
  bool isThirdTextVisible = false;
  bool isForTextVisible = false;
  bool englishbtn = true;
  bool eng = false;
  bool ar = false;
  bool ur = false;
  bool tr = false;

  void toggleFirstTextVisibility() {
    isFirstTextVisible = !isFirstTextVisible;
    notifyListeners();
  }

  void toggleSecondTextVisibility() {
    isSecondTextVisible = !isSecondTextVisible;
    notifyListeners();
  }

  void toggleThirdTextVisibility() {
    isThirdTextVisible = !isThirdTextVisible;
    notifyListeners();
  }

  void toggleForTextVisibility() {
    isForTextVisible = !isForTextVisible;
    notifyListeners();
  }

  void toggleEnglishTextVisibility() {
    englishbtn = !englishbtn;

    notifyListeners();
  }

  void hideFirstText() {
    isFirstTextVisible = false;
    notifyListeners();
  }

  void hideSecondText() {
    isSecondTextVisible = false;
    notifyListeners();
  }

  void hideThirdText() {
    isThirdTextVisible = false;
    notifyListeners();
  }

  void hideForText() {
    isForTextVisible = false;
    notifyListeners();
  }

  void hideEnglishText() {
    englishbtn = !englishbtn;
    notifyListeners();
  }

  void hideAllTextsAndShowThird() {
    isFirstTextVisible = false;
    isSecondTextVisible = false;
    isThirdTextVisible = true;
    isForTextVisible = false;
    englishbtn = false;
    notifyListeners();
  }
  void hideAllTextsAndShowFirst() {
    isFirstTextVisible = true;
    isSecondTextVisible = false;
    isThirdTextVisible = false;
    isForTextVisible = false;
    englishbtn = false;
    notifyListeners();
  }
  void hideAllTextsAndShowSecond() {
    isFirstTextVisible = false;
    isSecondTextVisible = true;
    isThirdTextVisible = false;
    isForTextVisible = false;
    englishbtn = false;
    notifyListeners();
  }

  void hideAllTextsAndShowFor() {
    isFirstTextVisible = false;
    isSecondTextVisible = false;
    isThirdTextVisible = false;
    isForTextVisible = true;
    englishbtn = false;
    notifyListeners();
  }

  // void hideAllTextsAndShowEnglish() {

  //   if(isFirstTextVisible == true || isSecondTextVisible == true || isThirdTextVisible == true || isForTextVisible == true){
  //   englishbtn = false;
  //   }
  //   // isFirstTextVisible = false;
  //   // isSecondTextVisible = false;
  //   // isThirdTextVisible = false;
  //   // isForTextVisible = false;
  //   // englishbtn = true;
  //   notifyListeners();
  // }

}
