// movie_detail_screen.dart
import 'package:flutter/material.dart';
import 'movie_model.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1447),
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(movie.imageUrl, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Text(
              movie.description,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text("Disponible en:",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...movie.platforms.map((platform) => Row(
                  children: [
                    const Icon(Icons.tv, color: Colors.purpleAccent, size: 18),
                    const SizedBox(width: 8),
                    Text(platform as String, style: const TextStyle(color: Colors.white)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
