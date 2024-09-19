import 'package:flutter/material.dart';

class TextVisibilityProvider with ChangeNotifier {
  bool isFirstTextVisible = false;
  bool isSecondTextVisible = false;
  bool isThirdTextVisible = false;
  bool isForTextVisible = false;
  bool isFiveTextVisible = false;
  bool isSixTextVisible = false;
  bool englishbtn = true;
  bool eng = false;
  bool ar = false;
  bool ur = false;
  bool tr = false;
  bool ps = false;
  bool ch = false;

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

  void toggleFiveTextVisibility() {
    isFiveTextVisible = !isFiveTextVisible;
    notifyListeners();
  }

  void toggleSixTextVisibility() {
    isSixTextVisible = !isSixTextVisible;
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

  void hideFiveText() {
    isFiveTextVisible = false;
    notifyListeners();
  }

  void hideSixText() {
    isSixTextVisible = false;
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
    isFiveTextVisible = false;
    isSixTextVisible = false;
    notifyListeners();
  }
  void hideAllTextsAndShowFirst() {
    isFirstTextVisible = true;
    isSecondTextVisible = false;
    isThirdTextVisible = false;
    isForTextVisible = false;
    englishbtn = false;
    isFiveTextVisible = false;
    isSixTextVisible = false;
    notifyListeners();
  }
  void hideAllTextsAndShowSecond() {
    isFirstTextVisible = false;
    isSecondTextVisible = true;
    isThirdTextVisible = false;
    isForTextVisible = false;
    englishbtn = false;
    isFiveTextVisible = false;
    isSixTextVisible = false;
    notifyListeners();
  }

  void hideAllTextsAndShowFor() {
    isFirstTextVisible = false;
    isSecondTextVisible = false;
    isThirdTextVisible = false;
    isForTextVisible = true;
    englishbtn = false;
    isFiveTextVisible = false;
    isSixTextVisible = false;
    notifyListeners();
  }

  void hideAllTextsAndShowFive() {
    isFirstTextVisible = false;
    isSecondTextVisible = false;
    isThirdTextVisible = false;
    isForTextVisible = false;
    englishbtn = false;
    isFiveTextVisible = true;
    isSixTextVisible = false;
    notifyListeners();
  }

  void hideAllTextsAndShowSix() {
    isFirstTextVisible = false;
    isSecondTextVisible = false;
    isThirdTextVisible = false;
    isForTextVisible = false;
    englishbtn = false;
    isFiveTextVisible = false;
    isSixTextVisible = true;
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
