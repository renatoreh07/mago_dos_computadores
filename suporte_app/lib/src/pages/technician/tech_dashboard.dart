import 'package:flutter/material.dart';

class TechDashboard extends StatelessWidget {
  const TechDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Painel do Técnico')), body: const Center(child: Text('Área do técnico')));
  }
}
