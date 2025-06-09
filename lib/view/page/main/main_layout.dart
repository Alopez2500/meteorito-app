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
      backgroundColor: AppColors.background,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 5),
            Expanded(child: widget.child),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: AppColors.accent,
          highlightColor: AppColors.accent.withOpacity(0.2),
          canvasColor: AppColors.surface,
        ),
        child: BottomNavigationBar(
          key: _bottomNavKey,
          iconSize: 27,
          useLegacyColorScheme: true,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
          selectedLabelStyle: TextStyle(color: AppColors.primary),
          unselectedLabelStyle: TextStyle(color: AppColors.textSecondary),
          backgroundColor: AppColors.surface,
          currentIndex: ref.watch(itemMenuProvider),
          onTap: (index) => _onItemTapped(index, context),
          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColors.surface,
              icon: Icon(Icons.cell_tower),
              label: "Futbol",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.surface,
              icon: Icon(Icons.live_tv_rounded),
              label: "F1",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.surface,
              icon: Icon(Icons.next_plan_outlined, size: 28),
              label: "TV",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.surface,
              icon: Icon(Icons.folder_copy_outlined),
              label: "Categorías",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.surface,
              icon: Icon(Icons.info_outline),
              label: "Preferencias",
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    final routes = [
      '/soccer',
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