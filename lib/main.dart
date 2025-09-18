import 'package:calculadora_churrasco/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
// A classe principal do aplicativo, que herda de StatelessWidget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Constrói a interface do usuário do aplicativo.
  ///
  /// Este widget é a raiz do seu aplicativo.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Churrasco',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 163, 108, 6),
        ),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
