


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget reusableSidebarItems(BuildContext context, String name, Function ontap){
  return Container(
    width: MediaQuery.of(context).size.width * .45,
    child: ListTile(
                        leading: Icon(Icons.square_foot),
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
  );
}