import 'package:flutter/material.dart';
import 'new_ticket_page.dart';

class TicketListPage extends StatefulWidget {
  const TicketListPage({Key? key}) : super(key: key);

  @override
  _TicketListPageState createState() => _TicketListPageState();
}

class _TicketListPageState extends State<TicketListPage> {
  final List<Map<String,dynamic>> tickets = [];

  @override
  Widget build(BuildContext context) {
    if (tickets.isEmpty) return const Center(child: Text('Nenhum chamado'));
    return ListView.builder(
      itemCount: tickets.length,
      itemBuilder: (context, i) {
        final t = tickets[i];
        return ListTile(title: Text(t['description']), subtitle: Text('Status: ${t['status']}'));
      },
    );
  }
}
