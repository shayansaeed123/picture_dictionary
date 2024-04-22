

import 'package:flutter/cupertino.dart';
import 'package:picture_dictionary/common/provider.dart';
import 'package:provider/provider.dart';

Widget reusableVisibility(Widget widget, bool visible){
  return Consumer<TextVisibilityProvider>(
                        builder: (context, textVisibilityProvider, child) {
                          return Visibility(
                            visible: visible,
                            child: widget,
                          );
                        }
                          );
}