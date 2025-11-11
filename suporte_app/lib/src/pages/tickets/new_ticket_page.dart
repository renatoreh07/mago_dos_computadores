import 'package:flutter/material.dart';
import '../../services/ai_service.dart';

class NewTicketPage extends StatefulWidget {
  const NewTicketPage({Key? key}) : super(key: key);

  @override
  _NewTicketPageState createState() => _NewTicketPageState();
}

class _NewTicketPageState extends State<NewTicketPage> {
  final _ctrl = TextEditingController();
  bool _loading = false;

  _send() async {
    if (_ctrl.text.trim().isEmpty) return;
    setState(() => _loading = true);
    final res = await AiService.askOffline(_ctrl.text.trim());
    setState(() => _loading = false);
    await showDialog(context: context, builder: (_) => AlertDialog(title: const Text('Resposta da IA'), content: Text(res['answer'] + '\n\n(Conf: ${ (res['confidence']*100).toStringAsFixed(0) }%)'), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))]));
    if (res['confidence'] < AiService.confidenceThreshold) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ticket criado e enviado ao técnico.')));
    }
    _ctrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo atendimento')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _ctrl, minLines: 4, maxLines: 8, decoration: const InputDecoration(labelText: 'Descreva o problema', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            _loading ? const CircularProgressIndicator() : ElevatedButton(onPressed: _send, child: const Text('Enviar para IA')),
          ],
        ),
      ),
    );
  }
}
