import 'package:flutter/material.dart';
import 'package:movieboxd/models/movie.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({super.key, required this.selectedMovie});

  final Movie selectedMovie;

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  String get snackBarText => widget.selectedMovie.isFavorite
      ? 'Movie added to favorites'
      : 'Movie removed from favorites';
  
  SnackBar get snackBar => SnackBar(
        content: Text(snackBarText),
        duration: const Duration(milliseconds: 1000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.grey,
        action: SnackBarAction(
          label: 'Dismiss',
          disabledTextColor: Colors.black,
          textColor: Colors.black,
          onPressed: () {
            //TODO: Dismiss
          },
        ),
        
      );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () {
          //TODO: Navigate to movie detail screen
        },
        child: _buildMovieCard(),
      ),
    );
  }

  Card _buildMovieCard() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.selectedMovie.imagePath,
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            Text(
              widget.selectedMovie.description,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            _buildLikeButton(),
          ],
        ),
      ),
    );
  }

  Color get iconColor => widget.selectedMovie.isFavorite
      ? const Color.fromARGB(255, 248, 27, 11)
      : Colors.red.shade400;

  IconData get favIcon =>
      widget.selectedMovie.isFavorite ? Icons.favorite :
      Icons.favorite_border;
  Widget _buildLikeButton() {
    return IconButton(
      onPressed: () => _favPressed(), 
      icon: Icon(
        favIcon,
        color: iconColor,
      ),
    );
  }

  void _favPressed() {
    setState(() {
      widget.selectedMovie.isFavorite = !widget.selectedMovie.isFavorite;
    });

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}