import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;

  const Result(this.resultScore, this.resetQuiz, {super.key});
  String get resultPhrase {
    String resultText;
    if (resultScore >= 24) {
      resultText = 'You are Perfect!';
    } else if (resultScore >= 21) {
      resultText = 'You are Normal';
    } else {
      resultText = 'You Suck!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: resetQuiz,
            child: const Text(
              'Restart Quiz!',
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ],
      ),
    );
  }
}

// FlatButton(
//             onPressed: resetQuiz,
//             child: const Text(
//               'Restart Quiz!',
//               style: TextStyle(color: Colors.purple),
//             ),
//           ),
