import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meteorito_app/config/util/colors_app.dart';

class MainLayout extends ConsumerStatefulWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  MainLayoutState createState() => MainLayoutState();
}

class MainLayoutState extends ConsumerState<MainLayout> {
  final GlobalKey _bottomNavKey = GlobalKey();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          // bottom: MediaQuery.of(context).padding.bottom + _bottomNavHeight,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // BannerContainer(AdSize.banner),
            // ContentNotification(),
            SizedBox(height: 5),
            Expanded(child: widget.child),
          ],
        ),
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(
          context,
        ).copyWith(splashColor: Colors.black, highlightColor: AppColors.gray),
        child: BottomNavigationBar(
          key: _bottomNavKey,
          iconSize: 27,
          useLegacyColorScheme: true,
          selectedItemColor: AppColors.gray,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(color: AppColors.gray),
          // Opcional
          unselectedLabelStyle: TextStyle(color: Colors.white),
          // Opcional
          currentIndex: ref.watch(itemMenuProvider),
          onTap: (index) => _onItemTapped(index, context),
          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColors.background,
              icon: Icon(Icons.cell_tower),
              label: "En vivo",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gray,
              icon: Icon(Icons.live_tv_rounded),
              label: "TV",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gray,
              icon: Icon(Icons.next_plan_outlined, size: 28),
              label: "Prox. Eventos",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gray,
              icon: Icon(Icons.folder_copy_outlined),
              label: "Categorias",
            ),

            BottomNavigationBarItem(
              backgroundColor: AppColors.gray,
              icon: Icon(Icons.folder_copy_outlined),
              label: "Info",
            ),
          ],
        ),
      ),
    );
  }

  // Función para cambiar de página al hacer clic en un botón
  void _onItemTapped(int index, BuildContext context) {
    final routes = [
      '/live',
      '/channels_tv',
      '/next_events',
      '/categories',
      '/settings',
    ];
    ref.read(itemMenuProvider.notifier).state = index;
    context.go(routes[index]);
  }

  final itemMenuProvider = StateProvider<int>((ref) => 0);

}
