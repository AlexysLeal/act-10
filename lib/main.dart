import 'package:flutter/material.dart';

void main() => runApp(const NetflixAlexysApp());

class NetflixAlexysApp extends StatelessWidget {
  const NetflixAlexysApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFE50914),
        ),
      ),
      home: const EligeTuPlanScreen(),
    );
  }
}

class EligeTuPlanScreen extends StatelessWidget {
  const EligeTuPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(Icons.arrow_back),
        title: const Text("Elige tu plan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text(
                  "Elige el plan ideal para ti",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Sin compromisos, cancela cuando quieras.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 30),
                
                // Plan Básico
                const PlanCard(
                  title: "Básico",
                  price: "139",
                  videoQuality: "Buena",
                  resolution: "720p (HD)",
                  devices: "1 dispositivo a la vez",
                  isSelected: false,
                ),
                
                // Plan Estándar
                const PlanCard(
                  title: "Estándar",
                  price: "219",
                  videoQuality: "Muy buena",
                  resolution: "1080p (Full HD)",
                  devices: "2 dispositivos a la vez",
                  isSelected: false,
                ),
                
                // Plan Premium (El destacado)
                const PlanCard(
                  title: "Premium",
                  price: "299",
                  videoQuality: "Excepcional",
                  resolution: "4K + HDR",
                  devices: "4 dispositivos a la vez",
                  isSelected: true,
                  isPopular: true,
                ),

                const SizedBox(height: 20),
                const Text(
                  "La disponibilidad del contenido en HD (720p), Full HD (1080p), Ultra HD (4K) y HDR depende de tu servicio de internet y de la capacidad del dispositivo. No todo el contenido está disponible en todas las resoluciones.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          
          // Botón Siguiente
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE50914),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                ),
                child: const Text(
                  "Siguiente",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String videoQuality;
  final String resolution;
  final String devices;
  final bool isSelected;
  final bool isPopular;

  const PlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.videoQuality,
    required this.resolution,
    required this.devices,
    required this.isSelected,
    this.isPopular = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 25),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF121212),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? const Color(0xFFE50914) : Colors.grey.withOpacity(0.3),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text("\$$price", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFE50914))),
                  const Text(" /mes", style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 20),
              _buildFeatureRow(Icons.check, "Calidad de video", videoQuality, isSelected),
              _buildFeatureRow(Icons.check, "Resolución", resolution, isSelected),
              _buildFeatureRow(Icons.check, "Dispositivos", devices, isSelected),
            ],
          ),
        ),
        if (isPopular)
          Positioned(
            top: -12,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE50914),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "MÁS POPULAR",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFeatureRow(IconData icon, String label, String value, bool active) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: active ? const Color(0xFFE50914) : Colors.grey),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Text(value, style: const TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }
}