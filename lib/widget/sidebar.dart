

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:picture_dictionary/controller/color_controller.dart';


class SideBar extends StatefulWidget {
   final VoidCallback fetchDataCallback;
  final List<String> categories;
  const SideBar({super.key, required this.fetchDataCallback, required this.categories});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<String> categories = [];

  @override
  void initState() {
    super.initState();
    // fetchData();
  }

  // Future<void> fetchData() async {
  //   // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint
  //   String apiUrl = 'YOUR_API_ENDPOINT';
  //   final response = await http.get(Uri.parse(apiUrl));

  //   if (response.statusCode == 200) {
  //     List<dynamic> data = json.decode(response.body);
  //     setState(() {
  //       categories = data.map((item) => item['name'].toString()).toList();
  //     });
  //   } else {
  //     // Handle API error
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      clipBehavior: Clip.antiAlias,
      backgroundColor: colorController.sidebarBg,
      child: Column(
        // padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.zero,
            child: DrawerHeader(
              decoration: BoxDecoration(
                // color: Colors.blue,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                  colorController.bgColorup,
                  colorController.bgColordown,
                ])
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Image.asset('assets/ic_launcher.png',alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * .5,
                height: MediaQuery.of(context).size.height * .1,),
                Text('Lorem Lipsam')
              ],),
            ),
          ),
            // for (var category in widget.categories)
            // ListTile(
            //   leading: Icon(Icons.category),
            //   title: Text(category),
            //   onTap: () {
            //     // Handle category tap
            //   },
            // ),
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: widget.categories.length > 5 ? widget.categories.length - 2 : 0,
                  itemBuilder: (context, index) {
                    var category = widget.categories[index];
                    return ListTile(
                      leading: Icon(Icons.square_foot),
                      title: Text(category),
                      onTap: () {
                        // Handle category tap
                      },
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                ),
            ),
          //   Divider(),
          // ListTile(
          //   leading: Icon(Icons.help),
          //   title: Text('Help'),
          //   onTap: () {
          //     // Handle help tap
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.info),
          //   title: Text('About'),
          //   onTap: () {
          //     // Handle about tap
          //   },
          // ),
          // Spacer(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              // Handle logout tap
            },
          ),
        ],
      ),
    );
  }
}