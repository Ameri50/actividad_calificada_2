import 'package:flutter/material.dart';
import '../screens/profile_screen.dart';

typedef ToggleThemeCallback = void Function();

class AppRoutes {
  static const initialRoute = '/';

  static Map<String, Widget Function(BuildContext)> getAppRoutes(ToggleThemeCallback onToggleTheme) {
    return {
      // Ruta inicial hacia el perfil del usuario
      '/': (_) => ProfileScreen(onToggleTheme: onToggleTheme),

      // Esta ruta NO debe usarse directamente porque requiere parámetros
      '/editProfile': (_) => throw UnimplementedError(
        'Navega a EditProfileScreen usando Navigator.push con argumentos explícitos.'
      ),
    };
  }
}
