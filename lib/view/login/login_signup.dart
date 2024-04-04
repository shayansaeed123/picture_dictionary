import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:picture_dictionary/res/re_text.dart';
import 'package:picture_dictionary/res/reusableloginbtn.dart';
import 'package:picture_dictionary/view/dashboard/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  signInWithGoogle()async{
    
    GoogleSignInAccount? googleUser = await  GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential = await  FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user!.displayName);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration:const BoxDecoration(
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
                      'assets/log.png',
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
                      reusabletext('Login', Colors.black, 23),
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(20),
                      //   child:
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF56acdd),
                          prefixIcon: Icon(Icons.email, color: Colors.white),
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                  color: Color(0xFF67c9f2), width: 4)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                  color: Color(0xFF67c9f2), width: 4)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                  color: Color(0xFF67c9f2), width: 4)),
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
                          fillColor: const Color(0xFF56acdd),
                          prefixIcon: const Icon(Icons.password_outlined,
                              color: Colors.white),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: Color(0xFF67c9f2), width: 4)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: Color(0xFF67c9f2), width: 4)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: Color(0xFF67c9f2), width: 4)),
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
                                  (states) => Color(0xFFcf93d9))),
                          onPressed: () {},
                          child: reusabletext('SIGN IN', Colors.black, 18))
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomePage()));
                      }),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      reusableLoginBtn('Sign in With  ', 'assets/google.png',
                          Colors.white, () {
                            signInWithGoogle();
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
