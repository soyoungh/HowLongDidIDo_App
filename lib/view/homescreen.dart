import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:howlongdidido_app/view/setting_page.dart';
import 'record_list_view.dart';
import 'timer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        child: Column(
            children: const [TimerScreen(), Expanded(child: RecordListView())]),
      ),
    );
  }
}
