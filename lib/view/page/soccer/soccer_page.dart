import 'package:flutter/material.dart';
import 'package:meteorito_app/config/util/colors_app.dart';

class SoccerPage extends StatelessWidget {
  const SoccerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final matches = [
      MatchData(
        status: 'EN VIVO',
        league: 'PREMIER LEAGUE',
        date: '15 FEB',
        time: '13:00',
        home: 'MANCHESTER CITY',
        away: 'MANCHESTER UNITED',
        flag: '🇬🇧',
        statusColor: Colors.green,
        borderColor: Colors.green,
      ),
      MatchData(
        status: 'EN VIVO',
        league: 'PREMIER LEAGUE',
        date: '15 FEB',
        time: '13:00',
        home: 'MANCHESTER CITY',
        away: 'MANCHESTER UNITED',
        flag: '🇬🇧',
        statusColor: Colors.green,
        borderColor: Colors.green,
      ),
      MatchData(
        status: 'EN VIVO',
        league: 'PREMIER LEAGUE',
        date: '15 FEB',
        time: '13:00',
        home: 'MANCHESTER CITY',
        away: 'MANCHESTER UNITED',
        flag: '🇬🇧',
        statusColor: Colors.green,
        borderColor: Colors.green,
      ),
      MatchData(
        status: 'PROXIMO',
        league: 'PREMIER LEAGUE',
        date: '15 FEB',
        time: '13:00',
        home: 'MANCHESTER CITY',
        away: 'MANCHESTER UNITED',
        flag: '🇬🇧',
        statusColor: Colors.orange,
        borderColor: Colors.orange,
      ),
      MatchData(
        status: 'PROXIMO',
        league: 'PREMIER LEAGUE',
        date: '15 FEB',
        time: '13:00',
        home: 'MANCHESTER CITY',
        away: 'MANCHESTER UNITED',
        flag: '🇬🇧',
        statusColor: Colors.orange,
        borderColor: Colors.orange,
      ),
      MatchData(
        status: 'EN VIVO',
        league: 'PREMIER LEAGUE',
        date: '15 FEB',
        time: '13:00',
        home: 'MANCHESTER CITY',
        away: 'MANCHESTER UNITED',
        flag: '🇬🇧',
        statusColor: Colors.grey,
        borderColor: Colors.grey,
      ),
      MatchData(
        status: 'EN VIVO',
        league: 'PREMIER LEAGUE',
        date: '15 FEB',
        time: '13:00',
        home: 'MANCHESTER CITY',
        away: 'MANCHESTER UNITED',
        flag: '🇬🇧',
        statusColor: Colors.grey,
        borderColor: Colors.grey,
      ),
      MatchData(
        status: 'PENDIENTE',
        league: 'PREMIER LEAGUE',
        date: '15 FEB',
        time: '13:00',
        home: 'MANCHESTER CITY',
        away: 'MANCHESTER UNITED',
        flag: '🇬🇧',
        statusColor: Colors.grey,
        borderColor: Colors.grey,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListView.separated(
        padding: EdgeInsets.zero,
        // Sin margen externo
        itemCount: matches.length,
        separatorBuilder: (_, __) => SizedBox(height: 0),
        // Sin espacio entre tarjetas
        itemBuilder: (context, i) => MatchCard(data: matches[i]),
      ),
    );
  }
}

class MatchData {
  final String status, league, date, time, home, away, flag;
  final Color statusColor, borderColor;

  MatchData({
    required this.status,
    required this.league,
    required this.date,
    required this.time,
    required this.home,
    required this.away,
    required this.flag,
    required this.statusColor,
    required this.borderColor,
  });
}


/// Widget que representa una tarjeta de partido de fútbol.
///
/// Muestra el estado, hora, fecha, liga, bandera y los equipos local y visitante.
/// El diseño utiliza colores y bordes para diferenciar el estado del partido.
class MatchCard extends StatelessWidget {
  /// Datos del partido a mostrar en la tarjeta.
  final MatchData data;

  /// Crea una tarjeta de partido con los datos proporcionados.
  const MatchCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Margen externo mínimo para separar las tarjetas.
      padding: EdgeInsets.all(2),
      child: Container(
        // Borde exterior con color según el estado del partido.
        decoration: BoxDecoration(
          color: data.borderColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          // Separación interna entre el borde y el contenido.
          padding: const EdgeInsets.all(2),
          child: Container(
            // Fondo principal de la tarjeta.
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Columna izquierda: Estado, hora y fecha del partido.
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Estado del partido (ej: EN VIVO, PROXIMO).
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      child: Text(
                        data.status,
                        style: TextStyle(
                          color: data.statusColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 8,
                        ),
                      ),
                    ),
                    // Hora del partido con icono.
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            color: Colors.white70,
                            size: 8,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            data.time,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Fecha del partido con icono.
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Colors.white70,
                            size: 8,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            data.date,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                // Columna derecha: Liga, bandera y equipos.
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 4,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Fila superior: Liga y bandera.
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.emoji_events,
                              color: Colors.amber,
                              size: 14,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              data.league,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              data.flag,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        // Fila inferior: Equipos y "VS" escalonados.
                        Row(
                          children: [
                            // Equipo local alineado a la izquierda.
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Text(
                                        data.home,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // "VS" centrado y más abajo.
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 6), // Baja el VS
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: data.borderColor,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Text(
                                    'VS',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Equipo visitante alineado a la derecha y más abajo.
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const SizedBox(height: 12),
                                    Text(
                                      data.away,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}