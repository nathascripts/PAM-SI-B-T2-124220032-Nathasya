import 'package:flutter/material.dart';
import 'package:tugas_2_124220032/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 252, 91, 217)),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}
