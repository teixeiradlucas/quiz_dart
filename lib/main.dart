import 'package:flutter/material.dart';
import 'package:pergunta_app/questionario.dart';
import './resultado.dart';
import './questionario.dart';
import 'app_controller.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _notaTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Quando a linguagem Dart surgiu?',
      'respostas': [
        {'texto': '2009', 'nota': 0},
        {'texto': '1999', 'nota': 0},
        {'texto': '2011', 'nota': 2},
        {'texto': '2017', 'nota': 0},
      ],
    },
    {
      'texto': 'Dart foi criado para substituir qual liguagem?',
      'respostas': [
        {'texto': 'Java', 'nota': 0},
        {'texto': 'Python', 'nota': 0},
        {'texto': 'C++', 'nota': 0},
        {'texto': 'JavaScript', 'nota': 2},
      ],
    },
    {
      'texto': 'Quem desenvolveu Dart?',
      'respostas': [
        {'texto': 'Google', 'nota': 2},
        {'texto': 'Apple', 'nota': 0},
        {'texto': 'Facebook', 'nota': 0},
        {'texto': 'Oracle', 'nota': 0},
      ],
    },
    {
      'texto': 'Qual framework mais usado no Dart?',
      'respostas': [
        {'texto': 'React', 'nota': 0},
        {'texto': 'Angular.js', 'nota': 0},
        {'texto': 'Flutter', 'nota': 2},
        {'texto': 'React Native', 'nota': 0},
      ],
    },
  ];

  void _responder(int nota) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _notaTotal += nota;
      });
    }
  }

  void _reiniciarPerguntas() {
    setState(() {
      _perguntaSelecionada = 0;
      _notaTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            brightness: AppController.instance.isDartTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Quiz de Dart"),
              actions: [
                CustomSwitcher(),
              ],
            ),
            body: temPerguntaSelecionada
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    quandoResponder: _responder,
                  )
                : Resultado(_notaTotal, _reiniciarPerguntas),
          ),
        );
      },
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class CustomSwitcher extends StatelessWidget {
  //SWITE PARA TEMA ESCURO
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDartTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
