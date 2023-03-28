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
          children: const [
            Card(
              margin: EdgeInsets.all(30),
              child: ListTile(
                title: Text("Remove Ads"),
                leading: Icon(Icons.block),
              ),
            )
          ],
        ));
  }
}
