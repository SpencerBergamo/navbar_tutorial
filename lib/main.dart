import 'package:flutter/material.dart';
import 'package:navbar_tutorial/screens/google_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bottom Navbar Playground',
      home: GoogleNav(),
    );
  }
}
