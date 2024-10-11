import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // El contenido principal de la página va aquí
          Center(child: Text("Contenido de la ventana")),

          // Botón circular en la esquina superior izquierda
          Positioned(
            top: 20, // Puedes ajustar esta posición según tus necesidades
            left: 20, // Puedes ajustar esta posición según tus necesidades
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26, // Color de la sombra
                    blurRadius: 6, // Desenfoque de la sombra
                    offset: Offset(0, 2), // Posición de la sombra
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.blue), // Flecha azul
                onPressed: () {
                  // Aquí defines la acción para volver atrás
                  Navigator.pop(context);
                },
                iconSize: 30.0, // Tamaño del icono
                padding: EdgeInsets.all(12.0), // Espaciado dentro del botón
                color: Colors.white, // Fondo del botón
              ),
            ),
          ),
        ],
      ),
    );
  }
}
