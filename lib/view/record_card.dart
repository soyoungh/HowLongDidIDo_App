import 'package:flutter/material.dart';

class RecordCard extends StatelessWidget {
  final GestureTapCallback onBodyTap;

  const RecordCard({super.key, required this.onBodyTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onBodyTap,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "3/21/2023, Tuesday",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text("User's quick notes...(optional)")
                  ],
                ),
              ),
            ),
            const Text("00:00:00",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
