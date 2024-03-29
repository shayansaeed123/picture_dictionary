

import 'package:flutter/material.dart';
import 'package:picture_dictionary/res/reusablehomebtn.dart';
import 'package:picture_dictionary/view/dashboard/items.dart';
import 'package:picture_dictionary/widget/sidebar.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: Color(0xFFffb64d),
      appBar: AppBar(
        backgroundColor: Color(0xFFffb64d),
        title: Text('Categories'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        automaticallyImplyLeading: false,
        actions: [
          reusablehomeBtn('ENG', (){}),
          SizedBox(width: MediaQuery.of(context).size.width * .01,),
          reusablehomeBtn('SEARCH', (){}),
          SizedBox(width: MediaQuery.of(context).size.width * .01,),
        ],
        ),
        drawer: SideBar(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // eb8815 f5d12d
                Color(0xFFe5af55),
                Color(0xFFe3e18e),
              ],
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.height * .01),
              child: 
              Container(
                width: MediaQuery.of(context).size.width * .44,
                height: MediaQuery.of(context).size.height * .261,
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(11),),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      margin: EdgeInsets.all(5),
                      child: Image.asset('assets/log.png',height: MediaQuery.of(context).size.height * .18,width: double.infinity,),
                      elevation: 7,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ItemsPage(),));
                },
                        child: Container(
                          width: double.infinity,
                          // height: MediaQuery.of(context).size.height*0.05,
                          margin: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
                          // padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.purple.shade800,borderRadius: BorderRadius.circular(8.0)),
                          child: Center(child: Text('Fruits',style: TextStyle(color: Colors.white),)),
                        
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
              child: Container(
                width: MediaQuery.of(context).size.width * .44,
                height: MediaQuery.of(context).size.height * .261,
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(11),),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      margin: EdgeInsets.all(5),
                      child: Image.asset('assets/log.png',height: MediaQuery.of(context).size.height * .18,width: double.infinity,),
                      elevation: 7,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        // height: MediaQuery.of(context).size.height*0.05,
                        margin: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
                        // padding: EdgeInsets.all(MediaQuery.of(context).size.height * .02),
                        decoration: BoxDecoration(color: Colors.purple.shade800,borderRadius: BorderRadius.circular(8.0)),
                        child: Center(child: Text('Fruits',style: TextStyle(color: Colors.white),)),
                      
                      ),
                    )
                  ],
                ),
              ),
            ), 
          ],
        ),
      )
      
    );
  }
}