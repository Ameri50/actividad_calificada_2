import 'package:flutter/material.dart';
import 'movie_model.dart';
import 'movie_detail_screen.dart';
import 'edit_profile_screen.dart';

typedef ToggleThemeCallback = void Function();

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.onToggleTheme});
  final ToggleThemeCallback onToggleTheme;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedTab = 'Watch History';

  // Datos del perfil
  String name = "Cristopher Nolan";
  String phone = "421 345 321";
  String email = "Nolan@gmail.com";
  String profileImageUrl =
      'https://images.pexels.com/photos/14653174/pexels-photo-14653174.jpeg?auto=compress&cs=tinysrgb&w=600';

  final List<Movie> movies = [
    Movie(
      title: "Wonder Woman",
      imageUrl: 'https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg',
      summary: "Heroína amazona en la Primera Guerra Mundial.",
      description: "Una heroína legendaria se une a los aliados para luchar contra las fuerzas del mal en plena Gran Guerra.",
      platforms: [
        MoviePlatform("HBO Max", "https://www.hbomax.com"),
        MoviePlatform("Apple TV", "https://tv.apple.com"),
        MoviePlatform("Google Play", "https://play.google.com"),
      ],
    ),
    Movie(
      title: "Venom",
      imageUrl: 'https://image.tmdb.org/t/p/w500/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg',
      summary: "Un simbionte alienígena invade San Francisco.",
      description: "Eddie Brock se convierte en el huésped del simbionte alienígena Venom, desatando un caos en su ciudad.",
      platforms: [
        MoviePlatform("Netflix", "https://www.netflix.com"),
        MoviePlatform("Amazon Prime Video", "https://www.primevideo.com"),
      ],
    ),
    Movie(
      title: "Bloodshot",
      imageUrl: 'https://cdn.sincroguia.tv/uploads/programs/b/l/o/bloodshot-772769_SPA-45.jpg',
      summary: "Soldado resucitado con nanotecnología.",
      description: "Un marine fallecido es traído a la vida con poderes sobrehumanos gracias a la nanotecnología.",
      platforms: [
        MoviePlatform("Disney+", "https://www.disneyplus.com"),
        MoviePlatform("Star+", "https://www.starplus.com"),
      ],
    ),
    Movie(
      title: "The Crocodile Hunter",
      imageUrl: 'https://image.tmdb.org/t/p/w500/6Wdl9N6dL0Hi0T1qJLWSz6gMLbd.jpg',
      summary: "Aventuras de Steve Irwin en la selva.",
      description: "Steve Irwin se enfrenta a las criaturas más peligrosas en un viaje por el mundo salvaje.",
      platforms: [
        MoviePlatform("Paramount+", "https://www.paramountplus.com"),
        MoviePlatform("YouTube", "https://www.youtube.com"),
      ],
    ),
    Movie(
      title: "Young Sherlock",
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgVbg8pHBrUsXqlODI4y-ZU-irKzH8UTh_7w&s',
      summary: "Los primeros pasos del joven detective.",
      description: "Sherlock Holmes resuelve su primer caso mientras aún es un adolescente.",
      platforms: [
        MoviePlatform("HBO Max", "https://www.hbomax.com"),
        MoviePlatform("Amazon Prime", "https://www.primevideo.com"),
      ],
    ),
    Movie(
      title: "Epic Adventure",
      imageUrl: 'https://image.tmdb.org/t/p/w500/q719jXXEzOoYaps6babgKnONONX.jpg',
      summary: "Un reino mágico en guerra.",
      description: "Una historia épica llena de acción, magia y criaturas extraordinarias en una tierra lejana.",
      platforms: [
        MoviePlatform("Netflix", "https://www.netflix.com"),
        MoviePlatform("Apple TV", "https://tv.apple.com"),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1447),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back, color: Colors.white),
                  GestureDetector(
                    onTap: () async {
                      final updatedData = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditProfileScreen(
                            name: name,
                            phone: phone,
                            email: email,
                            imageUrl: profileImageUrl,
                          ),
                        ),
                      );

                      if (updatedData != null && mounted) {
                        setState(() {
                          name = updatedData['name'];
                          phone = updatedData['phone'];
                          email = updatedData['email'];
                          profileImageUrl = updatedData['imageUrl'];
                        });
                      }
                    },
                    child: const Icon(Icons.edit, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Perfil
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(profileImageUrl),
                    ),
                    const SizedBox(height: 12),
                    Text(name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.phone, color: Colors.white54, size: 16),
                        const SizedBox(width: 5),
                        Text(phone, style: const TextStyle(color: Colors.white54)),
                        const SizedBox(width: 10),
                        const Icon(Icons.email, color: Colors.white54, size: 16),
                        const SizedBox(width: 5),
                        Text(email, style: const TextStyle(color: Colors.white54)),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Suscripción
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF2C2155),
                  // ignore: deprecated_member_use
                  border: Border.all(color: Colors.blueAccent.withOpacity(0.4)),
                ),
                child: Column(
                  children: const [
                    Icon(Icons.stars, color: Colors.yellowAccent),
                    SizedBox(height: 8),
                    Text("1 Year of Unlimited Moviez", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                    SizedBox(height: 4),
                    Text("USD 50.00 / 1 Year", style: TextStyle(color: Colors.greenAccent)),
                    SizedBox(height: 4),
                    Text("Expired on 05/08/2021", style: TextStyle(color: Colors.redAccent)),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedTab = 'Watch History'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: selectedTab == 'Watch History' ? Colors.deepPurpleAccent : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text("Watch History", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedTab = 'Downloaded'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: selectedTab == 'Downloaded' ? Colors.deepPurpleAccent : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text("Downloaded", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Películas
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: movies.map((movie) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MovieDetailScreen(movie: movie),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          movie.imageUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return const Center(child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: Colors.grey.shade800,
                            child: const Icon(Icons.broken_image, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
