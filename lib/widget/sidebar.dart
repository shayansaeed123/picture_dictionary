

import 'package:flutter/material.dart';


class SideBar extends StatefulWidget {
  const SideBar({super.key});

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
      // child: ListView.builder(
      //   itemCount: 10,
      //   // categories.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(index.toString()),
      //       onTap: () {
      //         // Call the callback function with the selected category
      //         // onCategorySelected('Category $index');
      //         // Close the drawer after selecting a category
      //         Navigator.pop(context);
      //       },
      //     );
      //   },
      // ),
      child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Drawer Header',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            // Handle home tap
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            // Handle settings tap
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.help),
          title: Text('Help'),
          onTap: () {
            // Handle help tap
          },
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('About'),
          onTap: () {
            // Handle about tap
          },
        ),
        Spacer(),
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