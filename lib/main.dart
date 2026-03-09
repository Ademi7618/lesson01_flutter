import 'package:flutter/material.dart';
import 'package:lesson01_flutter/characher/domain/presentation/screens/characters_screen.dart';
import 'package:lesson01_flutter/core/di/service_locator.dart';

void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CharactersScreen(),
    );
  }
}