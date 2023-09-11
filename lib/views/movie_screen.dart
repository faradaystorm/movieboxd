import 'package:flutter/material.dart';
import 'package:movieboxd/components/movie_card.dart';

import 'package:movieboxd/models/movie.dart';

class MovieScreen extends StatelessWidget {
  MovieScreen({super.key});

  final List<Movie> movieList = [
    Movie(
      description: "Great Movie!",
      imagePath:"assets/her.jpg"
    ),
    Movie(
      description: "Amazing Movie!",
      imagePath: "assets/lalaland.jpg",
    ),
    Movie(
      description: "Awesome Movie!",
      imagePath: "assets/coco.jpg",
    ),
    Movie(
      description: "Perfect Movie!",
      imagePath: "assets/itonya.jpg"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MovieBoxd"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 32, 30, 30),
      ),
      backgroundColor: Color.fromARGB(255, 199, 199, 199),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) => MovieCard(
          selectedMovie: movieList[index],
        ),
      ),
    );
  }
}