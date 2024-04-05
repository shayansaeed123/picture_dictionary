

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


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
      backgroundColor: Color(0xFFe3e18e),
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
                  Color(0xFFe5af55),
                  Color(0xFFe3e18e),
                ])
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
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