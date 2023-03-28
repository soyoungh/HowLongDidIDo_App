import 'package:flutter/material.dart';

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
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "3/21/2023, Tuesday",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text("User's quick notes...(optional)")
                            ],
                          ),
                          const Text("00:00:00",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
