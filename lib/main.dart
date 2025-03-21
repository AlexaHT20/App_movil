import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/schedule_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/register_pet_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/my_pet_screen.dart';
import 'screens/register_diet_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AUTOPET UTT',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
      ),
      initialRoute: '/', // Usamos rutas en lugar de home:
      routes: {
        '/': (context) => const WelcomeScreen(), // Pantalla de inicio
        '/register': (context) => const RegisterScreen(), // Pantalla de registro
        '/home': (context) => const HomeScreen(), // Pantalla principal con el menú
        '/schedule': (context) => const ScheduleScreen(), // Pantalla de horarios
        '/settings': (context) => const SettingsScreen(), // Pantalla de ajustes
        '/register_pet': (context) => const RegistrarMascotaScreen(), // Pantalla de registro de mascota
        '/miMascota': (context) => const MiMascotaScreen(
            nombre: '',
            edad: '',
            peso: '',
            rasgos: '',
            raza: '',
            salud: '',
            sexo: '',
            image: '',
          ),
          '/register_diet': (context) => const RegistrarDietaScreen(),
          // Pantalla de perfil de mascota
      },
    );
  }
}