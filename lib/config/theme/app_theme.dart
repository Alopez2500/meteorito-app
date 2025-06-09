import 'package:flutter/material.dart';

/// Lista de colores personalizados usados en el tema.
/// Puedes acceder a ellos por índice para mantener consistencia en la app.
const colorList = <Color>[
  Color.fromARGB(255, 255, 132, 0),   // Naranja principal
  Color.fromARGB(255, 252, 252, 252), // Blanco
  Color.fromARGB(255, 249, 84, 25),   // Rojo
  Color.fromARGB(255, 213, 255, 60),  // Verde claro
  Color.fromARGB(255, 32, 212, 1),    // Verde
];

/// Clase que define el tema visual de la aplicación.
/// Personaliza colores, tipografías y estilos de los componentes principales.
class AppTheme {
  /// Devuelve la configuración de [ThemeData] para la app.
  ThemeData getTheme() => ThemeData(
    useMaterial3: true, // Activa el diseño Material 3.
    primaryColor: colorList[0], // Color principal de la app (naranja).
    scaffoldBackgroundColor: Colors.black, // Fondo de las pantallas principales.
    canvasColor: Colors.black, // Fondo para elementos tipo canvas.
    splashColor: Colors.white24, // Color del efecto splash al pulsar botones.

    /// Esquema de colores general para la app.
    colorScheme: ColorScheme.dark(
      primary: colorList[0], // Color primario (naranja).
      secondary: colorList[2], // Color secundario (rojo).
      background: Colors.black, // Fondo general.
      surface: Colors.grey[900]!, // Fondo de superficies (tarjetas, menús).
      onPrimary: Colors.black, // Color sobre el primario (texto/íconos).
      onSecondary: Colors.white, // Color sobre el secundario.
      onBackground: Colors.white, // Color sobre el fondo.
      onSurface: Colors.white, // Color sobre superficies.
    ),

    /// Estilo de la barra superior de la app.
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black, // Fondo de la AppBar.
      foregroundColor: Colors.white, // Color de íconos y texto.
      elevation: 0, // Sin sombra.
      centerTitle: true, // Centra el título.
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),

    /// Estilo de la barra inferior.
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.black,
      elevation: 4,
    ),

    /// Estilo del botón flotante.
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorList[0], // Naranja.
      foregroundColor: Colors.black, // Ícono negro.
    ),

    /// Estilo de los botones elevados.
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorList[0], // Naranja.
        foregroundColor: Colors.black, // Texto negro.
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Bordes redondeados.
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),

    /// Estilo de los campos de texto (inputs).
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[850], // Fondo oscuro para inputs.
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorList[0]), // Borde naranja.
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorList[0], width: 2), // Borde más grueso al enfocar.
      ),
      labelStyle: const TextStyle(color: Colors.white70), // Color de las etiquetas.
      hintStyle: const TextStyle(color: Colors.white38), // Color de los hints.
    ),

    /// Estilos de los textos en la app.
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: Colors.white70),
      titleSmall: TextStyle(color: Colors.white60),
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
      bodySmall: TextStyle(color: Colors.white60),
      labelLarge: TextStyle(color: Colors.white),
      labelMedium: TextStyle(color: Colors.white70),
      labelSmall: TextStyle(color: Colors.white60),
    ),

    /// Color y estilo de los íconos.
    iconTheme: IconThemeData(color: colorList[0]),

    /// Color de fondo de las tarjetas.
    cardColor: Colors.grey[900],

    /// Color de las líneas divisorias.
    dividerColor: Colors.white24,
  );
}