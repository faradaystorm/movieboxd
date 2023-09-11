import 'package:flutter/material.dart';
import 'package:movieboxd/views/movie_screen.dart';
void main() {
  runApp(const MovieBoxdApp());
}

class MovieBoxdApp extends StatelessWidget {
  const MovieBoxdApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}