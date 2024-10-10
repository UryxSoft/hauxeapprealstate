import 'dart:async';
import 'package:flutter/material.dart';
import '/user_screen/intro_screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Configura un temporizador para navegar a la siguiente pantalla después de 3 segundos.
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obtiene el tamaño de la pantalla.
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 98,
          176), // Ajusta el color de fondo como en la imagen proporcionada
      body: Center(
        child: Container(
          width: size.width * 0.9, // Ajusta el tamaño del logo
          height: size.height * 0.9,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "/assets/intro_screen/hauxe.png"), // Añade tu logo aquí
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
