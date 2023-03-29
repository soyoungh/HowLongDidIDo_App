import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:howlongdidido_app/view/setting_page.dart';
import 'record_list_view.dart';
import 'timer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          title: const Text(
            "Study Tracker",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.calendar_view_month)),
            MenuItemButton(
              child: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Get.to(() => const SettingPage());
              },
            )
          ]),
      body: SafeArea(
        child: Column(children: const [
          TimerScreen(),
          Expanded(child: RecordListView()),
        ]),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: bannerAd == null ? Container() : AdWidget(ad: bannerAd!),
      ),
    );
  }
}
