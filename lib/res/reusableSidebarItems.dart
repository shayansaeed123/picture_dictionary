


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget reusableSidebarItems(BuildContext context, String name, Function ontap,{IconData icon = Icons.square_foot}){
  return 
  // Container(
    // width: MediaQuery.of(context).size.width * .7,
    // child: 
    Expanded(
      child: ListTile(
      
                          // leading: Icon(icon),
                          title: Text(name),
                          onTap: () {
                            ontap();
                            // Handle category tap
                  //             setState(() {
                  //                   selectedCategory = category;
                  //   itemsFuture = pictureRepo.fetchItemsByCategory(selectedCategory);
                  //   print('itemsssssssssssssss ${itemsFuture.toString()}');
                  //   Navigator.pop(context);
                  //   Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                                    
                  //                   builder: (context) => ItemsPage(categoriesFuture: categoriesFuture,itemsFuture: itemsFuture,),
                  //                 ));
                  // });
                          },
                        ),
    // ),
  );
}