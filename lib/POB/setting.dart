import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picture_dictionary/POB/reusablesetting.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isToggledValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                color: Colors.grey.shade300,
                child: settingText(
                    'Setting', Colors.grey, 13.5, FontWeight.w600,bottomPadding: 14,toppadding: 14)),
            settingText(
                'Health tips for you', Colors.black, 15, FontWeight.bold,toppadding: 8.0),
            Row(
              children: [
                Expanded(
                  child: settingText(
                      'Get information tips for your health lifeStyle',
                      Colors.grey,
                      13,
                      FontWeight.w600,toppadding: 5),
                ),
                    Padding(
                      padding: const EdgeInsets.only(top:  4.0),
                      child: settingSwitch(isToggledValue, (value) {
                                        setState(() {
                      isToggledValue = value; // Update switch state
                                        });
                                      }),
                    )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: settingText('Notification Setting', Colors.black, 15,
                      FontWeight.bold,bottomPadding: 14.0),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_right,
                      color: Colors.grey,
                      size: 25,
                    )),
              ],
            ),
            Container(
                width: double.infinity,
                color: Colors.grey.shade300,
                child: settingText(
                    'General', Colors.grey, 13.5, FontWeight.w600,bottomPadding: 14.0,toppadding: 14.0)),
            settingText('Language', Colors.black, 15, FontWeight.bold,bottomPadding: 5.0),
            settingText('About POB', Colors.black, 15, FontWeight.bold,bottomPadding: 5.0),
            settingText('Privacy Policy', Colors.black, 15, FontWeight.bold,bottomPadding: 5.0),
            settingText('Help and Support', Colors.black, 15, FontWeight.bold,bottomPadding: 5.0),
            settingText('Rate POB', Colors.black, 15, FontWeight.bold,bottomPadding: 5.0),
            Row(
              children: [
                Expanded(
                  child: settingText('Dark Theme', Colors.black, 15, FontWeight.bold,bottomPadding: 5.0)
                ),
                Padding(
                  padding: const EdgeInsets.only(top:  14.0),
                  child: settingSwitch(isToggledValue, (value) {
                    setState(() {
                      isToggledValue = value; // Update switch state
                    });
                  }),
                )
              ],
            ),
            Container(
                width: double.infinity,
                color: Colors.grey.shade300,
                child: settingText(
                    'Accounts', Colors.grey, 13.5, FontWeight.w600,bottomPadding: 14.0,toppadding: 14.0)),
            Row(
              children: [
                Expanded(
                  child: settingText('Logout', Colors.blue, 15, FontWeight.bold,toppadding: 0)
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.logout_outlined,color: Colors.blue,size: 25,))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
