

import 'package:flutter/cupertino.dart';
import 'package:picture_dictionary/common/provider.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:provider/provider.dart';

Widget reusableItemTextBtn(BuildContext context , Color color, String text,BorderRadius borderRadius){
  return Expanded(
                              flex: 1,
                              child: Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height * .05,
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: borderRadius,
                                  
                                ),
                                child: Center(
                                  child: Text(
                                    text,
                                    style: TextStyle(color: colorController.whiteColor),
                                  ),
                                ),
                              ),
                            );
}