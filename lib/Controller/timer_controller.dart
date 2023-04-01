import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  late Timer _timer;
  Duration _pausedDurations = const Duration();
  Duration _durations = const Duration();
  final isRunning = false.obs;
  final isPaused = false.obs;

  Duration get pausedDurations => _pausedDurations;
  Duration get durations => _durations;

  // @override
  // void onInit() {
  //   super.onInit();
  //   _pausedDurations = _duration;
  // }

  void startTimer() {
    isPaused.value = false;
    isRunning.value = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _durations = _durations + const Duration(seconds: 1);
    });
  }

  void pauseTimer() {
    isPaused.value = true;
    _timer.cancel();
    _pausedDurations = _durations;
  }

  void resumeTimer() {
    isPaused.value = false;
    startTimer();
  }

  void resetTimer() {
    _timer.cancel();

    _durations = const Duration();
    _pausedDurations = const Duration();
    isPaused.value = false;
    isRunning.value = false;
  }

  void toggleTimer() {
    if (isRunning.value) {
      if (isPaused.value) {
        resumeTimer();
      } else {
        pauseTimer();
      }
    } else {
      startTimer();
    }
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
