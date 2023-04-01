import 'package:flutter/material.dart';

import 'package:howlongdidido_app/view/record_card.dart';

class RecordListView extends StatelessWidget {
  const RecordListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(12, 18, 10, 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // Text("March 2023",
                  //     style:
                  //         TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text("Weekly total duration: 00:00:00",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                ],
              )),
          Expanded(
            child: Scrollbar(
              thickness: 6,
              radius: const Radius.circular(30),
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: ((context, index) {
                  return RecordCard(onBodyTap: () {
                    debugPrint("A card is tapped.");
                  });
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
