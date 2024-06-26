import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:picture_dictionary/common/MySharedPrefrence.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/res/re_text.dart';
import 'package:picture_dictionary/res/reusabledailog.dart';
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
  TextEditingController _userController = TextEditingController();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  String _errorMessage = '';

  final _formKey = GlobalKey<FormState>();
  var _email = '';
  var _password = '';
  var _username = '';
  bool isLoginPage = true;


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
          MySharedPrefrence().set_user_name(userCredential.user!.displayName);
          MySharedPrefrence().setUserLoginStatus(true); 
            MySharedPrefrence().set_user_email(userCredential.user!.email);
      print(MySharedPrefrence().get_user_name());
      print(MySharedPrefrence().getUserLoginStatus());
      print(MySharedPrefrence().get_user_email());
      Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => WillPopScope(
                                  onWillPop: () async => false,
                                  child: HomePage()),
                            ));
    } catch (e) {
      print('Error $e');
      reusabledialog(context, "Login Failed",
            "An error occurred while trying to log in.", "Ok", () {});
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  startAuthentication(){
    final validity = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if(validity){
      _formKey.currentState!.save();
      submitForm();
    }
  }
  submitForm()async{
    setState(() {
        _isLoading = true;
      });
    final auth = FirebaseAuth.instance;
    try{
      if(isLoginPage){
       UserCredential userCredential = await auth.signInWithEmailAndPassword(email: _emailController.text.toString(), password: _passwordController.text.toString());
       Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
      }else{
       await auth.createUserWithEmailAndPassword(email: _emailController.text.toString(), password: _passwordController.text.toString());
        isLoginPage = true;
        setState(() {

        });
      }
      setState(() {
        _isLoading = false;
      });

    }catch(e){
      print(e);
      reusabledialog(context, "Login Failed",
            "An error occurred while trying to log in.", "Ok", () {});
    }finally{
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Status  ${MySharedPrefrence().getUserLoginStatus()}');
    print('email  ${MySharedPrefrence().get_user_email()}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            reusabletext('Login', colorController.blackColor, 23),
                            // ClipRRect(
                            //   borderRadius: BorderRadius.circular(20),
                            //   child:
                            if(!isLoginPage)
                              TextFormField(
                              controller: _userController,
                              validator: (value) {
                              if(value!.isEmpty){
                                return 'incorrect username';
                              }
                              return null;
                            },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: colorController.textformfillColor,
                                prefixIcon: Icon(Icons.person, color: Colors.white),
                                hintText: 'Username',
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
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            
                        
                          TextFormField(
                              controller: _emailController,
                              validator: (value) {
                              if(value!.isEmpty){
                                return 'incorrect Email';
                              }
                              return null;
                            },
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
                              validator: (value) {
                              if(value!.isEmpty){
                                return 'incorrect password';
                              }
                              return null;
                            },
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
                                  startAuthentication();
                                  print('object');
                                  
                                },
                                child: isLoginPage ? reusabletext(
                                    'SIGN IN', colorController.blackColor, 18) : reusabletext(
                                    'SIGN UP', colorController.blackColor, 18)),
                                //     SizedBox(
                                // height: MediaQuery.of(context).size.height * .01),
                                     TextButton(onPressed: (){
                            setState(() {
                        
                            });
                            isLoginPage=!isLoginPage;
                          }, child: isLoginPage ? 
                          Text('Not a Member?',style: TextStyle(color: colorController.blackColor,fontWeight: FontWeight.bold),) 
                          : Text('Already a Member?',style: TextStyle(color: colorController.blackColor,fontWeight: FontWeight.bold),))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          reusableLoginBtn('Sign in as a Guest  ',
                              'assets/user.png', Colors.transparent, () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => WillPopScope(
                            //           onWillPop: () async => false,
                            //           child: HomePage()),
                            //     ));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
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
                  ],
                ),
              ),
            ),
            if (_isLoading == true) Center(child: reusableloadingrow(context, _isLoading)),
                Center(child: reusableloadingrow(context, _isLoading))
          ],
        ),
      ),
    );
  }
}
