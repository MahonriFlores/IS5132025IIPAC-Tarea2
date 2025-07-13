import 'package:flutter/material.dart';
import 'package:tarea2/data/user.dart' show Usuario, agregarUsuario, validarEmail;
import 'package:tarea2/src/widgets/texto.dart';

class RegistroPage extends StatefulWidget {
  RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final nombreController = TextEditingController();
  final numeroController = TextEditingController();
  final emailController = TextEditingController();
  final contraController = TextEditingController();
  bool isPasswordVisible = true;
  Color colorEmailCheck = Colors.black;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              const Text(
                'Registrarse',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              campoTexto(
                controler: nombreController,
                labeltext: 'Nombre',
                prefixicon: Icons.person_outline,
                hinttext: 'Ingrese su nombre',
                keyboardType: TextInputType.name,

              ),const SizedBox(height: 20),
              campoTexto(
                controler: numeroController,
                labeltext: 'Número de Teléfono',
                prefixicon: Icons.phone_android_outlined,
                hinttext: 'Ingrese su número de teléfono',
                keyboardType: TextInputType.phone,
              ),const SizedBox(height: 20),
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
              ),const SizedBox(height: 20),
              
              campoTexto(
                controler: contraController,
                labeltext: 'Contraseña',
                prefixicon: Icons.lock_outline,
                hinttext: 'Ingrese su contraseña',
                obscuretext: isPasswordVisible,
                suffixicon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                
              )
              ,
              const SizedBox(height: 20),
              
              ElevatedButton(
                onPressed: () {
                  // Logic for registration can be added here
                  if (nombreController.text.isEmpty ||
                      numeroController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      contraController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red[100],
                        duration: Duration(seconds: 2),
                        content: Text(
                          'Todos los campos son obligatorios',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      
                    );
                    
                    return;
                  }
                  
                  if (!emailController.text.contains('@unah.hn')){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red[100],
                        duration: Duration(seconds: 2),
                        content: Text(
                          'El correo debe ser de la UNAH',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                    return;
                  }

                  if (contraController.text.length < 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red[100],
                        duration: Duration(seconds: 2),
                        content: Text(
                          'La contraseña debe tener al menos 6 caracteres',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                    return;
                  }

                  Usuario nuevo = Usuario(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    name: nombreController.text,
                    email: emailController.text,
                    phone: numeroController.text,
                  );
                  
                  nuevo.setContra = contraController.text;
                  agregarUsuario(nuevo);
                  nombreController.clear();
                  numeroController.clear();
                  emailController.clear();
                  contraController.clear();
                  colorEmailCheck = Colors.black;
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green[100],
                      duration: Duration(seconds: 2),
                      content: Text(
                        'Registro exitoso',
                         style: TextStyle(
                          color: Colors.black
                          )
                        ,)
                    )
                  );
                },
                child: const Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}