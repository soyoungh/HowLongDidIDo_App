import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:howlongdidido_app/view/in-app-purchase.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
    );
  }
}
