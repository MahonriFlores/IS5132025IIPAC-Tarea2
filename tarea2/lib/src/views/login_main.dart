import 'package:flutter/material.dart';
import 'package:tarea2/src/views/login_pages/login_page.dart';
import 'package:tarea2/src/views/login_pages/registro_page.dart';

class LoginMainPage extends StatefulWidget {
  const LoginMainPage({super.key});

  @override
  State<LoginMainPage> createState() => _LoginMainPageState();
}

class _LoginMainPageState extends State<LoginMainPage> {
  final PageController pageController = PageController(initialPage: 0);
  int indice = 0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              indice = index;
            });
          },
          children: [
             LoginPage(),
             RegistroPage(),
            
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            // Handle navigation logic here
            setState(() {});
          indice = index;
            pageController.jumpToPage(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: 'Login',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.app_registration),
              label: 'Registro',
            ),
          ],
        )
    );
  }
}