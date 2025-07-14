import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
            
            body: Container(
              padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('./lib/src/utils/background.jpg'), 
                  fit: BoxFit.cover
                  
                ),
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                  ),
                  Text(
                    'Bienvenido a la App',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                 Text(
                  'Esta app es una tarea para la clase de Lenguajes de programacion de la UNAH, Realizada por Mahonri Flores',
                  style: TextStyle(
                  
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),textAlign: TextAlign.center,)
                  ,
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size( 300 , 40),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {
                      context.push('/login');
                    },
                    child: const Text('Iniciar Sesion', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size( 300 , 40),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {
                      context.push('/registro');
                    },
                    child: const Text('Registrarse' , style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),     
                ],
              )
            ),
    );
    
  }
}