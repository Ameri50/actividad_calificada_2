import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'movie_model.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  Future<void> _launchURL(String url, BuildContext context) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo abrir $url')),
      );
    }
  }

  Future<bool> newMethod(Uri uri) => canLaunchUrl(uri);

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                movie.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 220,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const SizedBox(
                    height: 220,
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 220,
                  color: Colors.grey.shade800,
                  child: const Center(
                    child: Icon(Icons.broken_image, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Título
            Text(
              movie.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            // Resumen
            const SizedBox(height: 10),
            Text(
              movie.summary,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 20),

            // Descripción
            const Text(
              "Descripción",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movie.description,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 30),

            // Plataformas
            const Text(
              "Disponible en:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: movie.platforms.map((platform) {
                return GestureDetector(
                  onTap: () {
                    _launchURL(platform.url, Navigator.of(context) as BuildContext);
                                    },
                  child: Chip(
                    label: Text(
                      platform.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    avatar: const Icon(Icons.play_circle_fill,
                        color: Colors.purpleAccent),
                    // ignore: deprecated_member_use
                    backgroundColor: Colors.deepPurpleAccent.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        // ignore: deprecated_member_use
                        color: Colors.deepPurpleAccent.withOpacity(0.4),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
