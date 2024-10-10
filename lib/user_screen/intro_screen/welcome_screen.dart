import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../user_screen/home_screen/home_screen2.dart';

class WelcomeScreen extends StatelessWidget {
  final Duration duration = const Duration(milliseconds: 400);

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("/assets//intro_screen/welcome.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido centrado

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment
                .center, // Asegura que los elementos estén centrados horizontalmente
            children: [
              FadeInUp(
                duration: duration,
                delay: const Duration(milliseconds: 800),
                child: Container(
                  margin: const EdgeInsets.only(
                      top:
                          20, // Reduzco el margen superior para moverlo más arriba
                      left: 5,
                      right: 5,
                      bottom:
                          10), // Ajusto el margen inferior para más separación del título
                  width: size.width /
                      1.8, // Ajusta el tamaño de la imagen para no ocupar todo el ancho
                  height: size.height /
                      4, // Reduzco la altura para que no ocupe tanto espacio
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("/assets//intro_screen/icon.png"),
                      fit: BoxFit
                          .contain, // Ajusto la imagen para que se contenga en el espacio
                      scale: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                  height: 10), // Espaciado más pequeño entre imagen y título

              /// Título
              FadeInUp(
                duration: duration,
                delay: const Duration(milliseconds: 1600),
                child: const Text(
                  "Hauxe",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30, // Incremento el tamaño para que resalte más
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(
                  height: 5), // Reduzco el espaciado entre título y subtítulo

              /// Subtítulo
              FadeInUp(
                duration: duration,
                delay: const Duration(milliseconds: 1000),
                child: const Text(
                  "Keep various ways to contact and get in touch easily right from the app.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.2, // Ajusto la altura de línea para mejor lectura
                    color: Colors.black,
                    fontSize:
                        16, // Un tamaño ligeramente menor para el subtítulo
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),

          /// Container alineado en la parte inferior
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white, // Fondo blanco del panel
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ), // Bordes redondeados superiores
              ),
              padding: const EdgeInsets.all(16), // Espacio interno
              child: Column(
                mainAxisSize: MainAxisSize.min, // Ajusta el tamaño al contenido
                children: [
                  // Botón de Número de Teléfono
                  GButton(
                    size: size,
                    borderColor: Colors.black,
                    color: Colors.black,
                    img: '/assets/intro_screen/Pt.png',
                    text: "Continue with Mobile Number",
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16),

                  // Botón de Email
                  SButton(
                    size: size,
                    borderColor: Colors.black,
                    color: Colors.black,
                    img: '/assets/intro_screen/Gt.png',
                    text: "Continue with Email Account",
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16), // Espacio entre botones

                  // Botón de Google
                  GButton(
                    size: size,
                    borderColor: Colors.grey,
                    color: Colors.white,
                    img: "/assets/intro_screen/g.png",
                    text: "Login with Google",
                    textStyle: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 16),

                  // Texto para registro
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don’t have an account?"),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          // Acción al hacer clic en Sign up
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class GButton extends StatelessWidget {
  const GButton({
    Key? key,
    required this.size,
    required this.color,
    required this.borderColor,
    required this.img,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  final Size size;
  final Color color;
  final Color borderColor;
  final String img;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () //{
      //Navigator.pushReplacement(
      //context,
      // MaterialPageRoute(
      // builder: ((context) => const SignInScreen()),
      //  ),
      // );
      //}
      //
      onTap: () async {
        // setState(() {
        //  _isSigningIn = true;
        //});
        //User? user = await Authentication.signInWithGoogle(context: context);

        // setState(() {
        //   _isSigningIn = false;
        // });

        //if (user != null) {
        //  Navigator.of(context).pushReplacement(
        //    MaterialPageRoute(
        //      builder: (context) => UserInfoScreen(
        //        user: user,
        //      ),
        //    ),
        //  );
        //}
      },

      child: Container(
        width: size.width / 1.2,
        height: size.height / 15,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: borderColor, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              height: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class SButton extends StatelessWidget {
  const SButton({
    Key? key,
    required this.size,
    required this.color,
    required this.borderColor,
    required this.img,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  final Size size;
  final Color color;
  final Color borderColor;
  final String img;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) =>
                const MyBottomNavyBar()), //const SignInScreen()),
          ),
        );
      },
      child: Container(
        width: size.width / 1.2,
        height: size.height / 15,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              height: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class PButton extends StatelessWidget {
  const PButton({
    Key? key,
    required this.size,
    required this.color,
    required this.borderColor,
    required this.img,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  final Size size;
  final Color color;
  final Color borderColor;
  final String img;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.pushReplacement(
        //  context,
        //  MaterialPageRoute(
        // builder: ((context) => const SignInScreen()),
        //  ),
        //);
      },
      child: Container(
        width: size.width / 1.2,
        height: size.height / 15,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: borderColor, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              height: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
