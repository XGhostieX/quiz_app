import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz(this.questions, this.questionIndex, this.answerQuestion,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(
        (questions[questionIndex]['question'] as String),
      ),
      ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
          .map((answer) => Answer(() => answerQuestion(answer['score']),
              (answer['text'] as String)))
          .toList(),
    ]);
  }
}
