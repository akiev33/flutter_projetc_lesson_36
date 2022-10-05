import 'package:flutter/material.dart';
import 'package:flutter_projetc_lesson_36/images/resources.dart';
import 'package:flutter_projetc_lesson_36/pageViewBuilder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const PageViewBuilder(),
    );
  }
}
