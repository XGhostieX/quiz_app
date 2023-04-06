import 'package:flutter/material.dart';

// import './question.dart';
// import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  final _questions = [
    {
      'question': 'What\'s your favorite Anime?',
      'answers': [
        {'text': 'Hunter x Hunter', 'score': 10},
        {'text': 'Attack on Titans', 'score': 7},
        {'text': 'Bleach', 'score': 5},
        {'text': 'Code Geass', 'score': 8}
      ],
    },
    {
      'question': 'What\'s your favorite Character?',
      'answers': [
        {'text': 'Yagami Light', 'score': 7},
        {'text': 'Eren Yeager', 'score': 5},
        {'text': 'Uchiha Itachi', 'score': 10},
        {'text': 'Lelouch Lamperouge', 'score': 8}
      ],
    },
    {
      'question': 'What\'s your favorite Tv-Series?',
      'answers': [
        {'text': 'Breaking Bad', 'score': 8},
        {'text': 'Mr. Robot', 'score': 10},
        {'text': 'Sherlock', 'score': 7},
        {'text': 'The Witcher', 'score': 5}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      if (_questionIndex < _questions.length) {
        _questionIndex = _questionIndex + 1;
      }
    });
    // print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
          backgroundColor: Colors.purple,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_questions, _questionIndex, _answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
