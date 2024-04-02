import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:picture_dictionary/res/reusablehomebtn.dart';
import 'package:picture_dictionary/view/dashboard/itemdetails.dart';
import 'package:picture_dictionary/widget/sidebar.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xFFffb64d),
          title: Text('Categories Name'),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          automaticallyImplyLeading: false,
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
        drawer: SideBar(),
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
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10),
                itemCount: 10,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.03,
                    left: MediaQuery.of(context).size.width * 0.03,
                    right: MediaQuery.of(context).size.width * 0.03,
                    child: 
                    Transform.rotate(
                      angle: 45  / 180,
                      // 45 * 3.1415927 / 180,
                      child: 
                      Container(
                        width: MediaQuery.of(context).size.width * .44,
                        height: MediaQuery.of(context).size.height * .20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // Color(0xFFffb64d),
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.03,
                    left: MediaQuery.of(context).size.width * 0.03,
                    right: MediaQuery.of(context).size.width * 0.03,
                    child: 
      //               Card(
      //   elevation: 2.0,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: <Widget>[
      //       Container(
      //           width: MediaQuery.of(context).size.width * .44,
      //                 height: MediaQuery.of(context).size.height * .261,
      //         color: Colors.blue,
      //         child: Center(
      //           child: Text(
      //             'Item $index',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         ),
      //       ),
      //       // Padding(
      //       //   padding: EdgeInsets.all(8.0),
      //         // child: 
      //         ElevatedButton(
      //           onPressed: () {
      //             // Button action
      //           },
      //           child: Text('Button $index'),
      //         ),
      //       // ),
      //     ],
      //   ),
      // ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> ItemDetails()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * .44,
                        height: MediaQuery.of(context).size.height * .20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Card(
                              margin: EdgeInsets.all(5),
                              child: Image.asset(
                                'assets/log.png',
                                height: MediaQuery.of(context).size.height * .15,
                                width: double.infinity,
                              ),
                              elevation: 7,
                              color: Colors.white,
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.purple.shade800,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Fruits',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        )

        // Container(
        //   decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //         begin: Alignment.topCenter,
        //         end: Alignment.bottomCenter,
        //         colors: [
        //           // eb8815 f5d12d
        //           Color(0xFFe5af55),
        //           Color(0xFFe3e18e),
        //         ],
        //       ),
        //     ),
        //   child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
        //   (crossAxisCount: 2,),
        //   itemBuilder: (context, index) {
        //     return Stack(
        //     children: [
        //       Positioned(
        //         top: MediaQuery.of(context).size.height * 0.03,
        //       left: MediaQuery.of(context).size.width * 0.03,
        //       right: MediaQuery.of(context).size.width * 0.03,
        //         child: Transform.rotate(
        //           angle: 45 * 3.1415927 / 180,
        //           child: Container(
        //             width: MediaQuery.of(context).size.width * .40,
        //             height: MediaQuery.of(context).size.height * .261,
        //             decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(11),),
        //           ),
        //         ),
        //       ),
        //       Positioned(
        //         top: MediaQuery.of(context).size.height * 0.03,
        //       left: MediaQuery.of(context).size.width * 0.03,
        //       right: MediaQuery.of(context).size.width * 0.03,
        //         child: Container(
        //           width: MediaQuery.of(context).size.width * .44,
        //           height: MediaQuery.of(context).size.height * .261,
        //           decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(11),),
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Card(
        //                 margin: EdgeInsets.all(5),
        //                 child: Image.asset('assets/log.png',height: MediaQuery.of(context).size.height * .18,width: double.infinity,),
        //                 elevation: 7,
        //               ),
        //               Expanded(
        //                 child: Container(
        //                   width: double.infinity,
        //                   margin: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
        //                   // padding: EdgeInsets.all(10),
        //                   decoration: BoxDecoration(color: Colors.purple.shade800,borderRadius: BorderRadius.circular(8.0)),
        //                   child: Center(child: Text('Fruits',style: TextStyle(color: Colors.white),)),
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   );
        //   },)
        // )

        );
  }

}
