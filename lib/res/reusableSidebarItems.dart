


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget reusableSidebarItems(BuildContext context, String name, Function ontap,{IconData icon = Icons.square_foot}){
  return 
    Expanded(
      child: ListTile(
                          title: Text(name),
                          onTap: () {
                            ontap();
                          },
                        ),
  );
}