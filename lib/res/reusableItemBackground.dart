

import 'package:flutter/cupertino.dart';

Widget reusableItemBackground(BuildContext context, String text){

  return Positioned(
                    top: MediaQuery.of(context).size.height * 0.01,
                    left: MediaQuery.of(context).size.width * 0.01,
                    right: MediaQuery.of(context).size.width * 0.01,
                    child: Image.asset(text,filterQuality: FilterQuality.high,fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width * .44,
                    height: MediaQuery.of(context).size.height * .20,)
                    );
}