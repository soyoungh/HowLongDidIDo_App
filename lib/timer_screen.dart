import 'dart:async';

import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  Duration _duration = const Duration();
  Timer? _timer;

  bool _isRunning = false;
  bool _isPaused = false;
  Duration _pausedDurations = const Duration();

  void startTimer() {
    setState(() {
      _isPaused = false;
      _isRunning = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _duration = _duration + const Duration(seconds: 1);
      });
    });
  }

  void pauseTimer() {
    setState(() {
      _isPaused = true;
    });
    _timer?.cancel();
    _pausedDurations = _duration;
  }

  void resumeTimer() {
    setState(() {
      _isPaused = false;
    });
    startTimer();
  }

  void resetTimer() {
    _timer?.cancel();
    setState(() {
      _duration = const Duration();
      _pausedDurations = const Duration();
      _isPaused = false;
      _isRunning = false;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int hours = (_isPaused ? _pausedDurations : _duration).inHours;
    int minutes =
        (_isPaused ? _pausedDurations : _duration).inMinutes.remainder(60);
    int seconds =
        (_isPaused ? _pausedDurations : _duration).inSeconds.remainder(60);

    String hoursStr = hours.toString().padLeft(2, '0');
    String minuteStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$hoursStr:$minuteStr:$secondsStr",
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_isRunning) {
                      if (_isPaused) {
                        resumeTimer();
                      } else {
                        pauseTimer();
                      }
                    } else {
                      startTimer();
                    }
                  });
                },
                child: Text(
                  _isRunning
                      ? _isPaused
                          ? 'Resume'
                          : 'Pause'
                      : 'Start',
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(onPressed: resetTimer, child: const Text("Reset"))
            ],
          )
        ],
      )),
    );
  }
}
