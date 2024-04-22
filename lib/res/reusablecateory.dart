


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picture_dictionary/controller/color_controller.dart';

Widget reusableCategory(BuildContext context, String imgUrl, String text, Function ontap){

  return GestureDetector(
                          onTap: () {
                            ontap();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: colorController.whiteColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(10),
                            child:  Container(
                      width: MediaQuery.of(context).size.width * .44,
                      height: MediaQuery.of(context).size.height * .361,
                      decoration: BoxDecoration(color: colorController.whiteColor,borderRadius: BorderRadius.circular(11),),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CachedNetworkImage(imageUrl: imgUrl,
                            errorWidget: (context, url, error) => Image.asset('assets/placeholder_not_found.png'),
                            width: double.infinity,
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high,
                            placeholder: (context, url) => Image.asset('assets/placeholder_loading.png'),
                            )
                          ),
                          Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height*0.05,
                            margin: EdgeInsets.all(MediaQuery.of(context).size.height * .001),
                            padding: EdgeInsets.all(MediaQuery.of(context).size.height * .003),
                            decoration: BoxDecoration(color: colorController.categoryBtnColor,borderRadius: BorderRadius.circular(8.0)),
                            child: Center(child: Text('${text }',textAlign: TextAlign.center, softWrap: true, style: TextStyle(color: Colors.white, fontFamily: 'English1',),)),
                          ),
                        ],
                      ),
                    ),
                          ),
                        );
}