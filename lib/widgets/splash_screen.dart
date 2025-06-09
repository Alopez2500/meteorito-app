import 'package:flutter/material.dart';

/// Pantalla de presentación (SplashScreen) que se muestra al iniciar la app.
/// Incluye logo, animación de carga y mensaje descriptivo.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      // Fondo con gradiente para mayor atractivo visual
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF181818),
              Color(0xFF232526),
              Color(0xFF414345),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo de la app (puedes cambiar el icono por tu logo)
              Icon(
                Icons.sports_soccer,
                size: 72,
                color: Colors.orangeAccent,
              ),
              const SizedBox(height: 32),
              // Animación de carga
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                backgroundColor: Colors.white24,
                strokeWidth: 5,
              ),
              const SizedBox(height: 24),
              // Mensaje de carga
              const Text(
                "Cargando eventos y configuraciones...",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}