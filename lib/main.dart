import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lalit_practical/view/timer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stop Timer',
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: const TimerScreen(),
    );
  }
}

