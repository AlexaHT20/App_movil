import 'package:flutter/material.dart';

class MiMascotaScreen extends StatelessWidget {
  final String nombre;
  final String edad;
  final String peso;
  final String rasgos;
  final String raza;
  final String salud;
  final String sexo;
  final String? image;

  const MiMascotaScreen({
    super.key,
    required this.nombre,
    required this.edad,
    required this.peso,
    required this.rasgos,
    required this.raza,
    required this.salud,
    required this.sexo,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mi mascota',
          style: TextStyle(color: Colors.brown),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 248, 238, 225), // Café claro
        iconTheme: const IconThemeData(color: Colors.brown), // Iconos marrones
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 252, 220, 192), // Fondo café claro
        ),
        child: Column(
          children: [
            // Imagen de la mascota
            Container(
              height: 200,
              width: 200, // Cuadro cuadrado para la imagen
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12), // Esquinas redondeadas
                image: image != null && image!.isNotEmpty
                    ? DecorationImage(
                        image: AssetImage(image!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 16),
            // Nombre de la mascota
            Text(
              nombre,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 16),
            // Información de la mascota
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildDataField('Edad', edad),
                    _buildDataField('Peso', peso),
                    _buildDataField('Rasgos', rasgos),
                    _buildDataField('Raza', raza),
                    _buildDataField('Salud', salud),
                    _buildDataField('Sexo', sexo),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Botón de editar
            ElevatedButton(
              onPressed: () {
                // Lógica para editar
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                'Editar',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            // Botón grande de ver dieta
            ElevatedButton(
              onPressed: () {
                // Lógica para ver dieta
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text(
                'Ver Dieta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para construir cuadros de datos
  Widget _buildDataField(String titulo, String valor) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.brown[50], // Fondo suave
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$titulo: ',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            TextSpan(
              text: valor,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
