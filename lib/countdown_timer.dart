import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Duration _duration = Duration(hours: 23, minutes: 59, seconds: 59 );
  late Timer _timer;
  late int _endTime;


  @override
  void initState() {
    super.initState();
    _initializeTimer();
  }

    void _initializeTimer() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEndTime = prefs.getInt('countdownEndTime');
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    if (savedEndTime != null && savedEndTime > currentTime) {
      // Calculate remaining time
      setState(() {
        _duration = Duration(milliseconds: savedEndTime - currentTime);
      });
      _endTime = savedEndTime;
      _startTimer();
    } else {
      // Save the new end time
_endTime =
          DateTime.now().millisecondsSinceEpoch + _duration.inMilliseconds;
      prefs.setInt('countdownEndTime', _endTime);
      _startTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_duration.inSeconds > 0) {
          _duration -=  Duration(seconds: 1);
        } else {
          _timer.cancel();
           _clearSavedTime();
        }
      });
    });
  }

   void _clearSavedTime() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('countdownEndTime');
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitHours = twoDigits(duration.inHours);
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitHours" "h " "$twoDigitMinutes" "m " "$twoDigitSeconds" "s remaining";
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_formatDuration(_duration),style: const TextStyle(color: Color(0xffFFFFFF))),
      ],
    );
  }
}