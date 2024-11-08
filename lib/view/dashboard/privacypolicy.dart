import 'package:flutter/material.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/res/re_text.dart';
import 'package:picture_dictionary/res/reusableloading.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
    late WebViewController _controller;
     bool _isLoading = false;
  String PrivacyText = """
English Language:
Picture Dictionary | PD
Play And Learn In Four Different Languages
Picture Dictionary or PD is fun; this one has excellent pictures with good attention to detail. 
Picture Dictionary or PD allows children and adults to learn more about shapes, colors, fruits, 
vegetables, and many more.
Picture Dictionary or PD comes in 4 different languages;
Urdu
English
Arabic
Turkish
So Play and learn vocabulary in English, Arabic, Turkish, and Urdu. It can also help you improve 
your pronunciation and allow you to learn, write and speak specific things in 4 different 
languages. 
Picture Dictionary can be used globally, and users from different regions and languages can use 
it for learning purposes.
PD also has games that can be used for revision. If you are learning fruits’ names through 
Picture Dictionary, you can take the test for correction in a fun way.
""";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorController.bgColorup,
      appBar: AppBar(title: Text('Privacy Policy'),),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        primary: true,
        child:  Container(
        height: MediaQuery.sizeOf(context).height * 1.7,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: WebView(
                  initialUrl: 'https://alqamoosulmusawwar.com/Backend/privacy_policy.php',
                  javascriptMode: JavascriptMode.unrestricted,
                  backgroundColor: colorController.bgColorup,
                  onWebViewCreated: (WebViewController webViewController){
                    _controller = webViewController;
                  },
                  onPageStarted: (String url){
                    // Utils.snakbarSuccess(context, 'Page is Loading');
                    print('$url ');
                  },
                  onWebResourceError: (error) {
                    Center(child: reusableloadingrow(context, _isLoading));
                  },
                ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     reusabletext(aboutusTextEnglish, colorController.whiteColor, 16),
          //     Text(aboutusTextUrdu, textAlign: TextAlign.right, style: TextStyle(color:  colorController.whiteColor,fontSize:  16,fontFamily: 'urdu2')),
          //     Text(aboutusTextArabi, textAlign: TextAlign.right, style: TextStyle(color:  colorController.whiteColor,fontSize:  16,fontFamily: 'urdu')),
          //     reusabletext(aboutusTextTurkey, colorController.whiteColor, 16),
          //   ],
          // ),
        ),
      ),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     reusabletext(PrivacyText, colorController.whiteColor, 14),
        //   ],
        // ),
      ),
    );
  }
}