import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/res/re_text.dart';
import 'package:picture_dictionary/res/reusableloading.dart';
import 'package:picture_dictionary/res/reusableloginbtn.dart';
import 'package:picture_dictionary/view/dashboard/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  String _errorMessage = '';

  Future<void> _signInWithEmailAndPassword() async {
  setState(() {
    _isLoading = true;
  });
  try {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    final User? user = userCredential.user;
    if (user != null) {
      // Navigate to the home screen upon successful login
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      setState(() {
        _errorMessage = 'User not found';
      });
    }
  } catch (e) {
    setState(() {
      _errorMessage = e.toString();
    });
  } finally {
    setState(() {
      _isLoading = false;
    });
  }
}


  signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });
    try {
      setState(() {
        _isLoading = false;
      });
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential.user!.displayName);
    } catch (e) {
      print('Error $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // eb8815 f5d12d
                colorController.bgColorup,
                colorController.bgColordown,
              ],
            ),
          ),
          // margin: EdgeInsets.all(10.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/ic_launcher.png',
                      height: 130,
                      width: 130,
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      reusabletext('Login', colorController.blackColor, 23),
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(20),
                      //   child:
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: colorController.textformfillColor,
                          prefixIcon: Icon(Icons.email, color: Colors.white),
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: colorController.textformborderColor,
                                  width: 4)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: colorController.textformborderColor,
                                  width: 4)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: colorController.textformborderColor,
                                  width: 4)),
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          // contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: colorController.textformfillColor,
                          prefixIcon: const Icon(Icons.password_outlined,
                              color: Colors.white),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: colorController.textformborderColor,
                                  width: 4)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: colorController.textformborderColor,
                                  width: 4)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: colorController.textformborderColor,
                                  width: 4)),
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          // contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .02),
                      ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.all(16.0)),
                              fixedSize: MaterialStateProperty.all(
                                  Size.fromWidth(
                                      MediaQuery.of(context).size.width)),
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => colorController.loginBtnColor)),
                          onPressed: () {
                            _signInWithEmailAndPassword();
                            print('object');
                            
                            // if (_emailController.text.isNotEmpty &&
                            //     _passwordController.text.isNotEmpty) {
                            //   logIn(_emailController.text, _passwordController.text).then((user) {
                            //     if (user != null) {
                            //       print("Login Sucessfull");
                            //       setState(() {
                            //         isLoading = false;
                            //       });
                            //       Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //               builder: (_) => HomePage()));
                            //     } else {
                            //       print("Login Failed");
                            //       setState(() {
                            //         isLoading = false;
                            //       });
                            //     }
                            //   });
                            // }
                          },
                          child: reusabletext(
                              'SIGN IN', colorController.blackColor, 18))
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .07,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      reusableLoginBtn('Sign in as a Guest  ',
                          'assets/user.png', Colors.transparent, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WillPopScope(
                                  onWillPop: () async => false,
                                  child: HomePage()),
                            ));
                      }),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      reusableLoginBtn('Sign in With  ', 'assets/google.png',
                          colorController.whiteColor, () {
                        signInWithGoogle();
                      })
                    ],
                  ),
                ),
                if (_isLoading == true) reusableloadingrow(context, _isLoading),
                reusableloadingrow(context, _isLoading)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
