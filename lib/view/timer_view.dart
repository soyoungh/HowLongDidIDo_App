import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:howlongdidido_app/Controller/timer_controller.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    final TimerController controller = Get.put(TimerController());

    int hours = (controller.isPaused.value
            ? controller.pausedDurations
            : controller.durations)
        .inHours;
    int minutes = (controller.isPaused.value
            ? controller.pausedDurations
            : controller.durations)
        .inMinutes
        .remainder(60);
    int seconds = (controller.isPaused.value
            ? controller.pausedDurations
            : controller.durations)
        .inSeconds
        .remainder(60);

    String hoursStr = hours.toString().padLeft(2, '0');
    String minuteStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    return Container(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      decoration: const BoxDecoration(color: Colors.amber),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Today's total duration",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          Text(
            "$hoursStr:$minuteStr:$secondsStr",
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => ElevatedButton(
                    onPressed: controller.toggleTimer,
                    child: Text(
                      controller.isRunning.value
                          ? controller.isPaused.value
                              ? 'Resume'
                              : 'Pause'
                          : 'Start',
                    ),
                  )),
              const SizedBox(width: 16),
              ElevatedButton(
                  onPressed: controller.resetTimer, child: const Text("Reset"))
            ],
          )
        ],
      ),
    );
  }
}
