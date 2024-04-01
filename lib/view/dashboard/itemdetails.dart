import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picture_dictionary/res/reusablehomebtn.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xFFffb64d),
          title: Text('Categories Name'),
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   onPressed: () {
          //     _scaffoldKey.currentState!.openDrawer();
          //   },
          // ),
          // automaticallyImplyLeading: false,
          actions: [
            reusablehomeBtn('ENG', () {}),
            SizedBox(
              width: MediaQuery.of(context).size.width * .01,
            ),
            reusablehomeBtn('SEARCH', () {}),
            SizedBox(
              width: MediaQuery.of(context).size.width * .01,
            ),
          ],
        ),
        // drawer: SideBar(),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFe5af55),
                Color(0xFFe3e18e),
              ],
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03),
                width: MediaQuery.of(context).size.width * .76,
                height: MediaQuery.of(context).size.height * .42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                width: MediaQuery.of(context).size.width * .76,
                height: MediaQuery.of(context).size.height * .28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.015),
                width: MediaQuery.of(context).size.width * .76,
                height: MediaQuery.of(context).size.height * .07,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.transparent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // padding: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
                      height: MediaQuery.of(context).size.height * .07,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xFFffb64d),width: 4),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFeb8815),
                          Color(0xFFeb8815),
                          // Color(0xFFe3e18e),
                        ],
                      ),
                    ),
                    child: IconButton(
                        icon: Center(child: Icon(Icons.arrow_back_ios,size: 35,)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Color(0xFFe3e18e),
                        ),
                    ),
                    Text('data'),
                    Container(
                      // padding: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
                      height: MediaQuery.of(context).size.height * .07,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xFFffb64d),width: 4),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFeb8815),
                          Color(0xFFeb8815),
                          // Color(0xFFe3e18e),
                        ],
                      ),
                    ),
                    child: IconButton(
                        icon: Center(child: Icon(Icons.arrow_forward_ios,size: 35,)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Color(0xFFe3e18e),
                        ),
                    ),
                  ],
                ),
              ),  
            ],
          ),
        ));
  }
}
