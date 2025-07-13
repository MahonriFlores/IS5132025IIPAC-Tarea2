import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final contraController = TextEditingController();
  final emailController = TextEditingController();
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
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Correo',
              contentPadding: EdgeInsets.all(22),
              hintText: 'Ingrese su correo',
              prefixIcon: Icon(Icons.email_outlined),
              suffixIcon: Icon(Icons.check_circle_outline),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
                controller: contraController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding: EdgeInsets.all(22),
                  // labelText: 'Holaaa',
                  label: Text('Ingrese su contraseña'),
                  hintText: 'Ingrese su contraseña',
                  prefixIcon: Icon(Icons.password_rounded),
                  // error: Text('El correo es obligatorio'),
                  // prefix: Icon(Icons.email_outlined),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: () {},
                  ),
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