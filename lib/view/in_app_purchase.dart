import 'package:flutter/material.dart';

class IAPPage extends StatelessWidget {
  const IAPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Study Tracker Pro"),
          backgroundColor: Colors.red,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Unlock all features in Study Tracker Pro \nfor just the price of a cup of coffee!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.all(30),
              child: Column(
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Icon(Icons.block),
                    title: Text("Remove Ads"),
                    subtitle: Text("Enjoy the app without any hassle!"),
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_month),
                    title: Text("Monthly Data Track"),
                    subtitle: Text("You can get a monthly overview."),
                  ),
                  ListTile(
                    leading: Icon(Icons.alarm_on),
                    title: Text("Get Notifications"),
                    subtitle: Text("Turn on alarms for motivation!"),
                  ),
                  ListTile(
                    leading: Icon(Icons.dark_mode),
                    title: Text("Dark Mode"),
                    subtitle: Text("Use the app with the dark apperance"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text("Upgrade for \$1.99"))
          ],
        ));
  }
}
