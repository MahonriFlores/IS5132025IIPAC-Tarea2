import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tarea2/src/views/home_page.dart';
import 'package:tarea2/src/views/login_main.dart';
import 'package:tarea2/src/views/login_pages/login_page.dart';
import 'package:tarea2/src/views/login_pages/registro_page.dart';


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
          initialLocation: '/',
          routes: [ 
            GoRoute(
              name: '/',
              path: '/',
              builder: (context, state) => const LoginMainPage(),
            ),
            GoRoute(
              name: 'login',
              path: '/login',
              builder: (context, state) =>  LoginPage(),
            ),
            GoRoute(
              name: 'registro',
              path: '/registro',
              builder: (context, state) => RegistroPage(),
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
