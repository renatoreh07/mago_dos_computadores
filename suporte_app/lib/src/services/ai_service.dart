class AiService {
  static const double confidenceThreshold = 0.75;

  static Future<Map<String, dynamic>> askOffline(String prompt) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final p = prompt.toLowerCase();
    if (p.contains('senha') || p.contains('login') || p.contains('senha do windows')) {
      return {'answer': 'Para redefinir a senha, solicite reset via administração. Siga o procedimento de RH.', 'confidence': 0.9};
    }
    if (p.contains('internet') || p.contains('wifi') || p.contains('rede')) {
      return {'answer': 'Verifique cabo e roteador. Reinicie o roteador e o computador. Se persistir, contate o suporte.', 'confidence': 0.85};
    }
    if (p.contains('nao liga') || p.contains('não liga') || p.contains('nao inicia')) {
      return {'answer': 'Checar fonte, cabos e luz de energia. Se não responder, encaminhar para assistência técnica.', 'confidence': 0.5};
    }
    return {'answer': 'Não conseguimos resolver automaticamente. Um técnico será acionado.', 'confidence': 0.4};
  }
}
