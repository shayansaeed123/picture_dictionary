import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:picture_dictionary/controller/color_controller.dart';
import 'package:picture_dictionary/res/re_text.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String aboutusTextEnglish = """
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
String aboutusTextUrdu = """
اردوزابن:
ابوصتریتغل | یپ ڈی
ںیلیھک اور اچر فلتخم ااب ںم س ں ںیھک
ابوصتری تغل ای یپ ڈی اکی رفتحیےہ؛ اس س ں الیصفتایھچ وتہج ےک اسھت دمعہ/رتہبنیاصتوریوموجدںیہ. رچکپ ڈرنشکی ای یپ ڈی وچبم 
اور ڑبوموک ولکشم ، روگنم ، ولھپم ، زبسویم اور تہب یس زیچوم ےکابرے س ں زمدی اجےنن اکومعقدیتیےہ۔
رچکپ ڈرنشکی ای یپ ڈی۴فلتخم ااب ںم س ں اکم رکیتےہ۔
اردو
ی
 
ارگن ي
رعیب
رتیک
وت آےیئ ارگنزیی ، رعیب ، رتیک اور اردو س ں ںیلیھک اور اافلظ ںیھک۔ ہی آپ وک اےنپ ظفلتوک رتہب انبےن س ں یھب دمد رکیتےہ اور آپ 
وک۴فلتخم ااب ںم س ں وصخمص زیچںی ےنھکیس ، ےنھکل اور وبےنل یک وہستلدیتیےہ۔ 
ابوصت يتغلوک اعیمل حطس رپ اامعتسل ایک اجاتکس ےہ ، اور فلتخم وطخم اور ااب ںم ےکاصر نی ا ے ےنھکیس ےک صاق د ےکےیل اامعتسل 
رکےتکس ںیہ۔
یپ ڈی س ں اےسی لیھک یھب ںیہ وج درہایئ ےک ےیل اامعتسل سوےتکس ںیہ۔ ارگ آپ ابوصت يتغلےک ذرہعی ولھپم ےکانم ھکیس رےہ ںیہ،
وت آپ رفتیحی ااداا س ں زمدیرتہبی ےک ےیل ٹسییھبےل ےتکس ںیہ۔
""";
String aboutusTextArabi = """
عیب زابن: 
القاموس املصور/یب دی
العب وتعلم يف أربع لغات خمتلفة.
 القاموس املصور قاموس ممتع ، ي
تضمن صورا مجيلة و رائعة باالستِيعاب.
يتيح القاموس املصور للصغار والكبار فرصة اتلعلم من خالل األشاكل، و األلوان، و صور الفواكه 
واخلرضاوات وغري ذلك من أشياء خمتلفة.
القاموس املصور حيتوى ىلع أربع لغات:
األردية
االجنلزيية
العربية
الرتكية
تعال! العب وتعلم املفردات يف اللغة اإلجنلزييةو العربية و الرتكية و األردية.و هذا سيساعدك يف 
حتسني اتللفظ، ويسهل لك اتللكم و الكتابة يف أربع لغات خمتلفة.
يمكن استخدام القاموس املصور اعمليا، ويستطيع ساكن مناطق خمتلفة مع اختالف لغاتهم أن 
يستفيدوا منه يف جمال اتلعلم.
و يف هذا اتلطبيق ألعاب ة
ّ
مسلي يمكن استخدامها للمراجعة، إذا تتعلم بهذا القاموس أسماء 
الفواكه فتستطيع أن ختترب نفسك بأسلوب ممتع.
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              reusabletext(aboutusTextEnglish, colorController.whiteColor, 16),
              Text(aboutusTextUrdu, style: TextStyle(color:  colorController.whiteColor,fontSize:  16,fontFamily: 'urdu')),
              Text(aboutusTextArabi, style: TextStyle(color:  colorController.whiteColor,fontSize:  16,fontFamily: 'urdu')),
              reusabletext(aboutusTextTurkey, colorController.whiteColor, 16),
            ],
          ),
        ),
      ),
    );
  }
}