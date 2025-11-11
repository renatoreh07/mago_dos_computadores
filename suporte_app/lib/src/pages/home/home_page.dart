import 'package:flutter/material.dart';
import '../tickets/new_ticket_page.dart';
import '../tickets/ticket_list_page.dart';
import '../technician/tech_dashboard.dart';

class HomePage extends StatelessWidget {
  final String role;
  const HomePage({Key? key, required this.role}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isTech = role == 'tech';
    return Scaffold(
      appBar: AppBar(title: const Text('Mago dos Computadores')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.add_comment),
              label: const Text('Abrir novo atendimento'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NewTicketPage())),
            ),
            const SizedBox(height: 12),
            Expanded(child: TicketListPage()),
            if (isTech) ElevatedButton.icon(icon: const Icon(Icons.engineering), label: const Text('Painel Técnico'), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TechDashboard()))),
          ],
        ),
      ),
    );
  }
}
