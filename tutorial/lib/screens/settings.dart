import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget{
  const SettingsScreen({super.key, required this.colorFondo});
  
  final Color colorFondo;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Container(
      color: colorFondo,
      child: const Center(
        child: Text('Pantalla settings'),
      ),
    );
  }

}