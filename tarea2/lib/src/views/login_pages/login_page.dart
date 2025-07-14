import 'package:flutter/material.dart';
import 'package:tarea2/data/user.dart';
import 'package:tarea2/src/widgets/texto.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key}){
    usuarios[0].contra = '20212001077';
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final contraController = TextEditingController();

  final emailController = TextEditingController();

  Color colorEmailCheck = Colors.black;
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('./lib/src/utils/background.jpg'),
            fit: BoxFit.cover
            ),
          ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SizedBox(height: 20),
            Container(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 20.0,
                vertical: 30.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Login',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                      ),
                  const SizedBox(height: 20),
                  campoTexto(
                        controler: emailController,
                        labeltext: 'Correo Electrónico',
                        prefixicon: Icons.email_outlined,
                        hinttext: 'Ingrese su correo electrónico',
                        keyboardType: TextInputType.emailAddress,
                        suffixicon: Icon(Icons.check_circle_outline, color: colorEmailCheck),
                        onchanged: (value) {
                          if (validarEmail(value.toLowerCase())) {
                            colorEmailCheck = Colors.green;
                          } else {
                            colorEmailCheck = Colors.red;
                          }
                          setState(() {});
                        },
                        color: colorEmailCheck,
                      ),
                  const SizedBox(height: 20),
                  campoTexto(
                        controler: contraController,
                        labeltext: 'Contraseña',
                        prefixicon: Icons.lock_outline,
                        hinttext: 'Ingrese su contraseña',
                        obscuretext: isPassword,
                        suffixicon: IconButton(
                          icon: Icon(
                            isPassword ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                        ),
                        
                      ),
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
                      // Handle login logic
                      if (!validarEmail(emailController.text.toLowerCase())){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(backgroundColor: Colors.red,content: Text('Correo electrónico no válido', style: TextStyle(color: Colors.black),)), snackBarAnimationStyle: AnimationStyle(
                            curve: Curves.easeInOut,
                            duration: Duration(seconds: 2),
                            reverseDuration: Duration(seconds: 2),
                      
                          )
                        );
                        return;
                      }
                      if (contraController.text.isEmpty) {
                        return;
                      }
                      
                      for (Usuario usuario in usuarios) {
                        // print('Email: ' + (usuario.email == emailController.text.toLowerCase()).toString());
                        // print('pass: '+ (usuario.compararContra(contraController.text)).toString());
                       if (usuario.email == emailController.text.toLowerCase() &&
                            usuario.compararContra(contraController.text)) {
                            context.go('/home');
                            // print('datos correctos');
                          }
                          // print('en el for');
                        }
                      
                    },
                    child: const Text('Entrar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}