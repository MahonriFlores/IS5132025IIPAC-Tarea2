import 'package:flutter/material.dart';
import 'package:tarea2/data/user.dart';
import 'package:tarea2/src/widgets/texto.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
            onPressed: () {
              // Handle login logic
            },
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
  }
}