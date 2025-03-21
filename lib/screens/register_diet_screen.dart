import 'package:flutter/material.dart';

class RegistrarDietaScreen extends StatefulWidget {
  const RegistrarDietaScreen({super.key});

  @override
  _RegistrarDietaScreenState createState() => _RegistrarDietaScreenState();
}

class _RegistrarDietaScreenState extends State<RegistrarDietaScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _edadController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _comidaController = TextEditingController();
  final TextEditingController _saludController = TextEditingController();
  final TextEditingController _razaController = TextEditingController();
  final TextEditingController _proporcionController = TextEditingController();
  final TextEditingController _medicamentoController = TextEditingController();

  String _tipoAnimalSeleccionado = 'Perro';

  void _registrarDieta() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Dieta registrada con éxito')),
      );
      Navigator.pop(context);
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Registrar Dieta"),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 248, 238, 225),
    ),
    body: Container(
      padding: const EdgeInsets.all(16),
      color: const Color.fromARGB(255, 252, 220, 192),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            _buildDropdownField("Tipo de Animal", ["Perro", "Gato", "Otro"]),
            _buildTextField("Edad (años)", _edadController, isNumeric: true),
            _buildTextField("Peso (kg)", _pesoController, isNumeric: true),
            _buildTextField("Comida Recomendada", _comidaController),
            _buildTextField("Estado de Salud", _saludController),
            _buildTextField("Raza", _razaController),
            _buildTextField("Proporción Recomendada", _proporcionController),
            _buildTextField("Tipo de Medicamento", _medicamentoController),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: _registrarDieta,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  minimumSize: const Size(100, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Registrar",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(235, 137, 77, 4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


  Widget _buildTextField(String label, TextEditingController controller, {bool isNumeric = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Por favor, ingrese $label";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdownField(String label, List<String> opciones) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        value: _tipoAnimalSeleccionado,
        items: opciones.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: (value) {
          setState(() {
            _tipoAnimalSeleccionado = value!;
          });
        },
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
