import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:meteorito_app/config/router/app_router.dart';
import 'package:meteorito_app/config/theme/app_theme.dart';
import 'package:meteorito_app/view/page/main/app_sync_wraper.dart';
import 'package:meteorito_app/widgets/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  runApp(const ProviderScope(child: AppSyncWrapper(child: MainApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainApp(),
    );
  }
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends ConsumerState<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return MaterialApp.router(
      color: Colors.blueAccent,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      builder: (context, child) => SplashWrapper(child: child!),
    );
  }
}

/// Wrapper que muestra el SplashScreen unos segundos y luego el contenido real.
class SplashWrapper extends ConsumerStatefulWidget {
  final Widget child;

  const SplashWrapper({super.key, required this.child});

  @override
  _SplashWrapperState createState() => _SplashWrapperState();
}

class _SplashWrapperState extends ConsumerState<SplashWrapper> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    // Espera 2 segundos y luego muestra el contenido real
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _showSplash = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showSplash) {
      return const SplashScreen();
    }
    return widget.child;
  }
}
