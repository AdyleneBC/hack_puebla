import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              //ogo
              CircleAvatar(
                radius: 40,
                backgroundColor: const Color(0xFF2E7D32),
                child: Icon(Icons.eco, color: Colors.white, size: 30),
              ),

              const SizedBox(height: 20),

              //Título
              const Text(
                "Bienvenido a CampoDirecto",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B3C2D),
                ),
              ),

              const SizedBox(height: 10),

              //Descripción
              const Text(
                "El marketplace que conecta productores agrícolas directamente con compradores",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const SizedBox(height: 30),

              //Card Productor
              roleCard(
                color: const Color(0xFF2E7D32),
                icon: Icons.people,
                title: "GOBIERNO",
                subtitle: "Dashboard de monitoreo y decisiones ",
                textColor: Colors.white,
                onTap: () {
                  print("Comprador");
                },
              ),

              const SizedBox(height: 20),

              //Card Comprador
              roleCard(
                color: Colors.white,
                icon: Icons.shopping_cart,
                title: "Soy Comprador",
                subtitle: "Compro productos del campo",
                textColor: Colors.black87,
                border: true,
                onTap: () {},
              ),

              const Spacer(),

              //Ya tengo cuenta
              GestureDetector(
                onTap: () {
                  print("Login");
                },
                child: const Text(
                  "Ya tengo cuenta",
                  style: TextStyle(
                    color: Color(0xFF2E7D32),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  //Widget reutilizable para cards
  Widget roleCard({
    required Color color,
    required IconData icon,
    required String title,
    required String subtitle,
    required Color textColor,
    bool border = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          border: border ? Border.all(color: Colors.grey.shade300) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            //Icono
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color == Colors.white
                    ? Colors.grey.shade200
                    : Colors.white24,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color == Colors.white ? Colors.green : Colors.white,
              ),
            ),

            const SizedBox(width: 15),

            //Texto
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: textColor.withOpacity(0.8),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
