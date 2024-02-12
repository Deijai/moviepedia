import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key, messages});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Carregando filmes...',
      'Aguarde mais ump pouco...',
      'Garregando filmes populares',
      'Está demorando mais que o esperado :('
    ];

    return Stream.periodic(const Duration(milliseconds: 1200), (stap) {
      return messages[stap];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Aguarde...'),
        const SizedBox(
          height: 10,
        ),
        const CircularProgressIndicator(
          strokeWidth: 2,
        ),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Carregando...');

              return Text(snapshot.data!);
            })
      ],
    ));
  }
}
