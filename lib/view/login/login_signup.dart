import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:picture_dictionary/res/re_text.dart';
import 'package:picture_dictionary/res/reusableloginbtn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/splash.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Container(
              color: Colors.white.withOpacity(0.8),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, World!',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'This is a responsive design example using Stack and Positioned widgets.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Container(width: 100,height: 100, child: CircleAvatar(backgroundColor: Colors.black,))),
            // Content
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Container(
              color: Colors.white.withOpacity(0.8),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   'Hello, World!',
                  //   style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  // ),
                  SizedBox(height: 16.0),
                  Text(
                    'This is a responsive design example using Stack and Positioned widgets.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: CircleAvatar(backgroundColor: Colors.black,radius: 60,))
        ],
      ),
        
        // Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter,
        //       colors: [
        //         Color(0xFFeb8815),
        //         Color(0xFFf5d12d),
        //       ],
        //     ),
        //   ),
        //   // margin: EdgeInsets.all(10.0),
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        //   child: SingleChildScrollView(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         SizedBox(
        //           height: MediaQuery.of(context).size.height * .06,
        //         ),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Image.asset(
        //               'assets/log.png',
        //               height: 130,
        //               width: 130,
        //             )
        //           ],
        //         ),
        //         SizedBox(
        //           height: MediaQuery.of(context).size.height * .1,
        //         ),
        //         Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           // mainAxisAlignment: MainAxisAlignment.start,
        //           children: [
        //             reusabletext('Login', Colors.black, 23),
        //             // ClipRRect(
        //             //   borderRadius: BorderRadius.circular(20),
        //             //   child:
        //             TextFormField(
        //               controller: _emailController,
        //               decoration: InputDecoration(
        //                 filled: true,
        //                 fillColor: Colors.blue[400],
        //                 prefixIcon: Icon(Icons.email, color: Colors.white),
        //                 hintText: 'Email',
        //                 hintStyle: TextStyle(color: Colors.white),
        //                 border: OutlineInputBorder(
        //                     borderRadius: BorderRadius.circular(25),
        //                     borderSide: BorderSide(
        //                         color: Colors.blue.shade200, width: 4)),
        //                 enabledBorder: OutlineInputBorder(
        //                     borderRadius: BorderRadius.circular(25),
        //                     borderSide: BorderSide(
        //                         color: Colors.blue.shade200, width: 4)),
        //                 focusedBorder: OutlineInputBorder(
        //                     borderRadius: BorderRadius.circular(25),
        //                     borderSide: BorderSide(
        //                         color: Colors.blue.shade200, width: 4)),
        //                 errorBorder: InputBorder.none,
        //                 disabledBorder: InputBorder.none,
        //                 // contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        //               ),
        //               keyboardType: TextInputType.emailAddress,
        //             ),
        //             SizedBox(
        //               height: MediaQuery.of(context).size.height * .01,
        //             ),
        //             TextFormField(
        //               controller: _passwordController,
        //               obscureText: true,
        //               obscuringCharacter: '*',
        //               decoration: InputDecoration(
        //                 filled: true,
        //                 fillColor: Colors.blue[400],
        //                 prefixIcon:
        //                     Icon(Icons.password_outlined, color: Colors.white),
        //                 hintText: 'Password',
        //                 hintStyle: TextStyle(color: Colors.white),
        //                 border: OutlineInputBorder(
        //                     borderRadius: BorderRadius.circular(25),
        //                     borderSide: BorderSide(
        //                         color: Colors.blue.shade200, width: 4)),
        //                 enabledBorder: OutlineInputBorder(
        //                     borderRadius: BorderRadius.circular(25),
        //                     borderSide: BorderSide(
        //                         color: Colors.blue.shade200, width: 4)),
        //                 focusedBorder: OutlineInputBorder(
        //                     borderRadius: BorderRadius.circular(25),
        //                     borderSide: BorderSide(
        //                         color: Colors.blue.shade200, width: 4)),
        //                 errorBorder: InputBorder.none,
        //                 disabledBorder: InputBorder.none,
        //                 // contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        //               ),
        //               keyboardType: TextInputType.text,
        //             ),
        //             SizedBox(height: MediaQuery.of(context).size.height * .02),
        //             ElevatedButton(
        //                 style: ButtonStyle(
        //                     padding:
        //                     MaterialStateProperty.all(EdgeInsets.all(16.0)),
        //                     fixedSize: MaterialStateProperty.all(Size.fromWidth(
        //                         MediaQuery.of(context).size.width)),
        //                     backgroundColor: MaterialStateColor.resolveWith(
        //                         (states) => Colors.purple.shade200)),
        //                 onPressed: () {},
        //                 child: reusabletext('SIGN IN', Colors.black, 18))
        //           ],
        //         ),
        //         SizedBox(
        //           height: MediaQuery.of(context).size.height * .07,
        //         ),
        //         Column(
        //           children: [
        //             reusableLoginBtn('Sign in as a Guest  ', 'assets/user.png',
        //                 Colors.transparent, () {}),
        //             SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        //             reusableLoginBtn('Sign in With  ', 'assets/google.png',
        //                 Colors.white, () {})
        //           ],
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      
      ),
    );
  }
}
