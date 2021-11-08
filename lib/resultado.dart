import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota;
  final void Function() quandoReiniciarPerguntas;

  Resultado(this.nota, this.quandoReiniciarPerguntas);

  String get fraseResultado {
    if (nota == 2) {
      return 'Tente melhorar! \n Você acertou uma pergunta.';
    } else if (nota == 4) {
      return 'Muito bem! \n Você acertou duas perguntas.';
    } else if (nota == 6) {
      return 'Parabés! \n Você acertou três perguntas.';
    } else if (nota == 8) {
      return 'Incrivel!!! \n Você acertou todas perguntas.';
    } else {
      return 'Tente novamente! \n Você errou todas perguntas.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(fraseResultado,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 28)),
        ),
        SizedBox(height: 50),
        ElevatedButton(
          onPressed: quandoReiniciarPerguntas, 
          child: Text('Tente Novamente')
        ),
      ],
    );
  }
}
