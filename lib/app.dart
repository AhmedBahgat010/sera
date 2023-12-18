import 'package:flutter/material.dart';
import 'package:sera/Features/Visitor/home/presentaion/view/HomevisitorScreen.dart';
import 'package:sera/Features/auth/presentaion/view/login_screen.dart';

import 'Core/Theme/LightTheme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: HomeVisitorScreen(),
    );
  }
}

