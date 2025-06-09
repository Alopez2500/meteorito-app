import 'package:flutter/material.dart';

class F1Page extends StatelessWidget {
  const F1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFF101820),
        body: Column(
          children: [
            // Info del evento
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E2A38),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green, width: 2),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Columna izquierda: EN VIVO, hora, fecha
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                          child: Text(
                            'EN VIVO',
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                color: Colors.white70,
                                size: 10,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '15:00',
                                // Cambia por la hora real si es necesario
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                color: Colors.white70,
                                size: 10,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '15 FEB',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Espacio entre columnas
                    const SizedBox(width: 16),
                    // Columna central: campeonato, gran premio, botones
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Campeonato
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.emoji_events,
                                  color: Colors.amber,
                                  size: 10,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'CAMPEONATO MUNDIAL DE F1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Gran premio
                          const Padding(
                            padding: EdgeInsets.only(top: 4.0),
                            child: Text(
                              'GRAN PREMIO DE ESPAÑA',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          // Botones de play
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              bottom: 8.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _PlayButton(label: 'PLAY 1'),
                                const SizedBox(width: 8),
                                _PlayButton(label: 'PLAY 2'),
                                const SizedBox(width: 8),
                                _PlayButton(label: 'PLAY 3 ON BOARD'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // TabBar
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white24)),
              ),
              child: const TabBar(
                indicatorColor: Colors.orange,
                labelColor: Colors.orange,
                unselectedLabelColor: Colors.white,
                labelStyle: TextStyle(fontSize: 12),
                // Tamaño para la pestaña seleccionada
                unselectedLabelStyle: TextStyle(fontSize: 12),
                // Tamaño para las no seleccionadas
                tabs: [
                  Tab(text: 'TABLA DE PILOTOS'),
                  Tab(text: 'TABLA DE CONSTRUCTORES'),
                ],
              ),
            ),
            // TabBarView
            Expanded(
              child: TabBarView(children: [PilotsTable(), ConstructorsTable()]),
            ),
          ],
        ),
      ),
    );
  }
}

// Ejemplo de tabla de pilotos
class PilotsTable extends StatelessWidget {
  final List<Map<String, dynamic>> pilots = const [
    {
      'pos': 1,
      'name': 'Oscar Piastri',
      'team': 'Mc Laren',
      'points': 186,
      'wins': 5,
      'podiums': 8,
    },
    {
      'pos': 2,
      'name': 'L. Norris',
      'team': 'Mc Laren',
      'points': 176,
      'wins': 2,
      'podiums': 8,
    },
    {
      'pos': 3,
      'name': 'M. Verstappen',
      'team': 'RedBull',
      'points': 137,
      'wins': 2,
      'podiums': 4,
    },
  ];

  const PilotsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowColor: MaterialStateProperty.all(const Color(0xFF1E2A38)),
      dataRowColor: MaterialStateProperty.all(const Color(0xFF101820)),
      columns: const [
        DataColumn(
          label: Row(
            children: [
              Text('#', style: TextStyle(color: Colors.white, fontSize: 10)),
              SizedBox(width: 4),
              Text(
                'PILOTO',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
        ),
        DataColumn(
          label: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  'PUNTOS',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
              SizedBox(width: 24),
              Text(
                'TRIUNFOS',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              SizedBox(width: 24),
              Text(
                'PODIOS',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
        ),
      ],
      rows: pilots.map((p) {
        return DataRow(
          cells: [
            DataCell(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        '${p['pos']}.',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        p['name'],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Text(
                    p['team'],
                    style: const TextStyle(color: Colors.white70, fontSize: 10),
                  ),
                ],
              ),
            ),
            DataCell(
              Row(
                children: [
                  const SizedBox(width: 16),
                  Text(
                    '${p['points']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 60),
                  Text(
                    '${p['wins']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 51),
                  Text(
                    '${p['podiums']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

// Ejemplo de tabla de constructores
class ConstructorsTable extends StatelessWidget {
  final List<Map<String, dynamic>> constructors = const [
    {'pos': 1, 'name': 'Mc Laren', 'points': 362, 'wins': 7, 'podiums': 16},
    {'pos': 2, 'name': 'RedBull', 'points': 137, 'wins': 2, 'podiums': 4},
  ];

  const ConstructorsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowColor: MaterialStateProperty.all(const Color(0xFF1E2A38)),
      dataRowColor: MaterialStateProperty.all(const Color(0xFF101820)),
      columns: const [
        DataColumn(
          label: Row(
            children: [
              Text('#', style: TextStyle(color: Colors.white, fontSize: 10)),
              SizedBox(width: 4),
              Text(
                'CONSTRUCTOR',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
        ),
        DataColumn(
          label: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  'PUNTOS',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
              SizedBox(width: 24),
              Text(
                'TRIUNFOS',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              SizedBox(width: 24),
              Text(
                'PODIOS',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
        ),
      ],
      rows: constructors.map((c) {
        return DataRow(
          cells: [
            DataCell(
              Row(
                children: [
                  Text(
                    '${c['pos']}.',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 5),
                  Text(c['name'], style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
            DataCell(
              Row(
                children: [
                  const SizedBox(width: 16),
                  Text(
                    '${c['points']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 60),
                  Text(
                    '${c['wins']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 51),
                  Text(
                    '${c['podiums']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

class _PlayButton extends StatelessWidget {
  final String label;

  const _PlayButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        textStyle: const TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
      ),
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.play_arrow, size: 7),
          const SizedBox(width: 2),
          Text(label),
        ],
      ),
    );
  }
}
