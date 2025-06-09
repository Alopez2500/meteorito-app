import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meteorito_app/view/page/main/main_layout.dart';
import 'package:meteorito_app/view/page/soccer/soccer_page.dart';

/// Clave global para el navegador raíz.
/// Permite controlar la navegación desde cualquier parte de la app.
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

/// Crea una página con transición de deslizamiento horizontal.
/// [child] es el widget que se mostrará en la página.
CustomTransitionPage buildSlideTransitionPage(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

/// Router principal de la aplicación.
/// Define todas las rutas y sus transiciones.
/// Usa páginas mock si las reales aún no existen.
final appRouter = GoRouter(
  initialLocation: '',
  navigatorKey: rootNavigatorKey,
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainLayout(child: child),
      routes: [
        // Ruta: En vivo
        GoRoute(
          path: '/soccer',
          pageBuilder: (context, state) => buildSlideTransitionPage(const SoccerPage()),
        ),
        // Ruta: Resultados en vivo
        GoRoute(
          path: '/live_score',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const MockPage(title: 'ResultLivePage'),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
        ),
        // Ruta: Categorías
        GoRoute(
          path: '/categories',
          pageBuilder: (context, state) => buildSlideTransitionPage(const MockPage(title: 'CategoryPage')),
        ),
        // Ruta: Campeonatos (con parámetros extra)
        GoRoute(
          path: '/championships',
          pageBuilder: (context, state) {
            // Puedes usar los parámetros extra si los necesitas en el futuro
            // final extraData = state.extra as Map<String, dynamic>?;
            return buildSlideTransitionPage(const MockPage(title: 'ChampionshipComponent'));
          },
        ),
        // Ruta: Próximos eventos
        GoRoute(
          path: '/next_events',
          pageBuilder: (context, state) => buildSlideTransitionPage(const MockPage(title: 'UpcomingEvents')),
        ),
        // Ruta: Canales de TV
        GoRoute(
          path: '/channels_tv',
          pageBuilder: (context, state) => buildSlideTransitionPage(const MockPage(title: 'ChannelTvPage')),
        ),
        // Ruta: Información / Ajustes
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) => buildSlideTransitionPage(const MockPage(title: 'InfoPage')),
        ),
        // Ruta: Filtro de partidos (mock de parámetros)
        GoRoute(
          path: '/fitlter_match',
          name: "filter_match",
          pageBuilder: (context, state) {
            // final params = state.extra as FilterMatchScreenParams;
            return buildSlideTransitionPage(const MockPage(title: 'MatchesByChampionship'));
          },
        ),
        // Ruta: Tabla de posiciones (mock de parámetros)
        GoRoute(
          path: '/table_positions',
          name: "table_positions",
          pageBuilder: (context, state) {
            // final leagueModel = state.extra as LeagueModel?;
            return buildSlideTransitionPage(const MockPage(title: 'TablePositions'));
          },
        ),
      ],
    ),
    // Redirección raíz
    GoRoute(path: '/', redirect: (_, __) => '/soccer'),
  ],
);

/// Página mock para evitar errores de compilación.
/// Muestra solo el nombre de la pantalla.
class MockPage extends StatelessWidget {
  final String title;
  const MockPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    );
  }
}