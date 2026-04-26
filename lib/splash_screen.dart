import 'package:flutter/material.dart';
import 'role_selection_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    //Animacoin de puntitos
    animateDots();

    //Navegación después de 2 segundos
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
      );
    });
  }

  void animateDots() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;

      setState(() {
        currentIndex = (currentIndex + 1) % 3;
      });

      animateDots(); //loop
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF2E7D32),
        child: Column(
          children: [
            const Spacer(),

            //Logo
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Icon(Icons.eco, color: Color(0xFF2E7D32), size: 40),
            ),

            const SizedBox(height: 20),

            //Nombre
            const Text(
              "CampoDirecto",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            //Slogan
            const Text(
              "Conectando el campo con tu mesa",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),

            const Spacer(),

            //Puntitos animados
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dot(currentIndex == 0),
                dot(currentIndex == 1),
                dot(currentIndex == 2),
              ],
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget dot(bool activo) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: activo ? 10 : 8,
      height: activo ? 10 : 8,
      decoration: BoxDecoration(
        color: activo ? Colors.white : Colors.white38,
        shape: BoxShape.circle,
      ),
    );
  }
}
