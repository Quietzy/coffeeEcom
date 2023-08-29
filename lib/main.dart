import 'package:flutter/material.dart';
import 'package:grocery/pages/intro_page.dart';
import 'package:grocery/pages/nav_pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/intropages': (context) => const IntroPage(),
        '/menupage': (context) => const MainPage(),
      },
    );
  }
}
