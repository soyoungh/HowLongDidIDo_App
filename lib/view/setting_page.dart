import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:howlongdidido_app/view/in_app_purchase.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  BannerAd? bannerAd;
  final String androidTestID = "ca-app-pub-3940256099942544/6300978111";
  final String iOSTestID = "ca-app-pub-3940256099942544/2934735716";
  final String androidAdUnitID = "ca-app-pub-5585665050991980/2313736714";
  final String iOSAdUnitID = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: Platform.isIOS ? iOSTestID : androidTestID,
        listener: const BannerAdListener(),
        request: const AdRequest())
      ..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: const Text("In-App Purchase"),
          ),
          Card(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: InkWell(
              onTap: () {
                Get.to(() => const IAPPage());
              },
              child: const ListTile(
                title: Text("Study Tracker Pro"),
                leading: Icon(Icons.star_border),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: const Text("Notifications"),
          ),
          Card(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Column(
              children: [
                ListTile(
                  title: const Text("Alarms for the cumulative time"),
                  subtitle: const Text("Repeat: Every 1 hour"),
                  leading: const Icon(Icons.timelapse),
                  trailing: Switch(
                    value: false,
                    onChanged: (val) {},
                  ),
                ),
                const Divider(
                  height: 10,
                  indent: 16,
                  endIndent: 16,
                  thickness: 1,
                ),
                ListTile(
                  title: const Text(
                      "Alarms for time elapsed since the last pause"),
                  subtitle: const Text("Repeat: Every 1 hour"),
                  leading: const Icon(Icons.notifications_active),
                  trailing: Switch(
                    value: false,
                    onChanged: (val) {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: const Text("Display"),
          ),
          Card(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: ListTile(
              title: const Text("Dark Mode"),
              leading: const Icon(Icons.dark_mode),
              trailing: Switch(
                value: false,
                onChanged: (val) {},
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: const Text("Data Management"),
          ),
          const Card(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: ListTile(
                title: Text("Remove all data"),
                leading: Icon(Icons.delete_outline),
                trailing: Icon(Icons.keyboard_arrow_right)),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: bannerAd == null ? Container() : AdWidget(ad: bannerAd!),
      ),
    );
  }
}
