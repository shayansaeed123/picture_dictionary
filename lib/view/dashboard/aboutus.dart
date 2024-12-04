import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/res/reusableloading.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  late WebViewController _controller;
  bool _isLoading = true;
  String aboutusTextEnglish = """
English Language:

Picture Dictionary | PD

Play And Learn In six Different Languages

Picture Dictionary or PD is fun; this one has excellent pictures with good attention to detail. Picture Dictionary or PD allows children and adults to learn more about shapes, colors, fruits, vegetables, and many more.

Picture Dictionary or PD comes in 6 different languages;
Urdu
English
Arabic
Turkish
Chinese
Pashto

So Play and learn vocabulary in English, Arabic, Turkish, Chinese, Pashto, and Urdu. It can also help you improve your pronunciation and allow you to learn, write and speak specific things in 6 different languages. 

Picture Dictionary can be used globally, and users from different regions and languages can use it for learning purposes.

PD also has games that can be used for revision. If you are learning fruits’ names through Picture Dictionary, you can take the test for correction in a fun way.

""";
String aboutusTextUrdu = """
اردو  زبان:
باتصویرلغت | پی ڈی
کھیلیں اور چھمختلف زبانوں میں سیکھیں
باتصویر لغت  یا پی ڈی ایک تفریح ہے؛ اس میں تفصیلا اچھی توجہ کے ساتھ عمدہ/بہترین تصاویرموجود ہیں. پکچر ڈکشنری یا پی ڈی بچوں اور بڑوں کو شکلوں ، رنگوں ، پھلوں ، سبزیوں اور بہت سی چیزوں کے بارے میں مزید جاننے کا موقع دیتی ہے۔
پکچر ڈکشنری یا پی ڈی6 مختلف زبانوں میں کام کرتی ہے۔
اردو
انگريزی
عربی
ترکی
تو آئیے  انگریزی ، عربی ، ترکی ،چائینیز،پشتواور  اردو میں کھیلیں اور الفاظ سیکھیں۔ یہ آپ کو اپنے تلفظ کو بہتر بنانے میں بھی مدد کرتی ہے اور آپ کو6 مختلف زبانوں میں مخصوص چیزیں سیکھنے ، لکھنے اور بولنے کی سہولت دیتی ہے۔ 
باتصوير لغت  کو عالمی سطح پر استعمال کیا جاسکتا ہے ، اور مختلف خطوں اور زبانوں کے صارفین اسے سیکھنے کے مقاصد کےلیے استعمال کرسکتے ہیں۔
پی ڈی میں ایسے کھیل بھی ہیں جو دہرائی  کے لیے استعمال ہوسکتے ہیں۔ اگر آپ  باتصوير لغت کے ذریعہ پھلوں کے نام سیکھ رہے ہیں، تو آپ تفریحی انداز میں مزیدبہتری کے لیے ٹیسٹ بھی لے سکتے ہیں۔ 
""";
String aboutusTextArabi = """
عربی زبان: 
القاموس المصور/بی دی
العب وتعلم في ست لغات مختلفة.
القاموس المصور قاموس ممتع ، يتضمن صورًا جميلة و رائعة بالاستِيعاب.
يتيح القاموس المصور للصغار والكبار فرصة التعلم من خلال الأشكال، و الألوان، و صور  الفواكه والخضراوات وغير ذلك من أشياء مختلفة.
القاموس المصور يحتوى على ست لغات:
العربية
الانجليزية
الأردية
التركية
الصينة
البشتوية
تعال! العب وتعلم المفردات في اللغة الإنجليزية و العربية و التركية و الأردية والصينية والبشتوية. و هذا سيساعدك في تحسين التلفظ، ويسهل لك التكلم و الكتابة في ست لغات مختلفة.
يمكن استخدام القاموس المصور عالميا، ويستطيع سكان مناطق مختلفة مع اختلاف لغاتهم أن يستفيدوا منه في مجال التعلم.
و في هذا التطبيق ألعاب مسليّة يمكن استخدامها للمراجعة، إذا تتعلم بهذا القاموس أسماء الفواكه فتستطيع أن تختبر نفسك بأسلوب ممتع.
""";
String aboutusTextTurkey = """
Türkçe : 
Resimli sözlük/PD 
Oynayarak dört farklı dil öğren.
Resimli sözlük oynarken sizi eğlendiren en özel resimlerle donatılmıştır.
Yetiskinlere, çocuklara her kesime hitap edecek bir üslupla hazırlanmış olup içersinde; 
Şekiller,renkler,meyveler,sebze ve birçok muhtelif eşyayı barındırmak tadır.
Resimli sözlük icersinde dört dil bulunmaktadır: 
 Urduca
 İngilizce 
 Arapça 
 Türkçe 
Gelin sizde eğlenceli oyunlarla urduca,ingilizce,arapça ve türkçe 
öğrenin. Bu sizin teleffuzunuzu güzelleştirerek dört dil’de okuma 
yazma ve konuşmayı ögrenmenizi kolaylaştıracaktır.
Türkçe sözlük dünya çapında kullanılabilir ve farklı dillere sahip 
farklı bölgelerde yaşayanlar, öğrenme aşamasında bundan 
istifade edebilir.
Uglumadaki kelimelerin tekrarı için eğlenceli oyunlarla 
kendinizide de test edebilirsiniz.
""";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Us'),),
      backgroundColor: colorController.bgColorup,
      body: Stack(
        children: [
          Container(
        height: MediaQuery.sizeOf(context).height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: WebView(
                  initialUrl: 'https://alqamoosulmusawwar.com/Backend/about.php',
                  javascriptMode: JavascriptMode.unrestricted,
                  backgroundColor: colorController.bgColorup,
                  onWebViewCreated: (WebViewController webViewController){
                    _controller = webViewController;
                  },
                  onPageStarted: (String url){
                     // Show loading indicator when the page starts loading
              setState(() {
                _isLoading = true;
              });
              print('Page loading started: $url');
                  },
                  onPageFinished: (String url) {
              // Hide loading indicator when the page finishes loading
              setState(() {
                _isLoading = false;
              });
              print('Page loading finished: $url');
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
      // Loading Indicator
          if (_isLoading)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: reusableloadingrow(context, true),),
              ],
            )
        ],
      )
    );
  }
}