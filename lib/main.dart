import 'package:flutter/material.dart';
import 'package:jadwal/user_profil.dart';
import 'package:provider/provider.dart'; // Impor provider
// Gantilah ini dengan path ke model Anda
import 'jadwal.dart';
import 'senin.dart';
import 'pengaturan.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      // Inisialisasi Provider di sini
      create: (context) => UserProfile(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'jadwal',
      initialRoute: '/',
      routes: {
        '/': (context) => const Landing(),
        '/jadwal': (context) => const Jadwal(),
        '/senin': (context) => const Senin(),
        '/pengaturan': (context) => const Pengaturan(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const Landing(),
        );
      },
    );
  }
}
