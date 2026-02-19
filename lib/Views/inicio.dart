import 'package:flutter/material.dart';

class inicio extends StatelessWidget {
  const inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Universidad
            const Text(
              'Universidad de las Fuerzas Armadas - ESPE',
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Serif',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            // Imagen
            Image.asset(
              'assets/logo.png',
              width: 250,
              height: 250,
            ),

            const SizedBox(height: 25),

            // Nombre y nivel
            const Text(
              'Nombre: Angeli Tello',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Serif',
              ),
            ),
            const Text(
              'Nivel: Sexto Semestre',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontFamily: 'Serif',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
