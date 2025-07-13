import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tarea2/src/views/home_page.dart';
import 'package:tarea2/src/views/login_main.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: 
        GoRouter(
          initialLocation: '/login',
          routes: [
            GoRoute(
              name: 'login',
              path: '/login',
              builder: (context, state) => const LoginMainPage(),
            ),
            GoRoute(
              name: 'home',
              path: '/home',
              builder: (context, state) => const HomePage(),
            ),
          ]
      )
    );
  }
}
