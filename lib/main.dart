import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 50},
        {'text': 'Red', 'score': -10},
        {'text': 'Green', 'score': 20},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Cat', 'score': 15},
        {'text': 'Duck', 'score': 5},
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Bird', 'score': 8},
      ]
    },
    {
      'questionText': 'Who\'s your favorite Hero?',
      'answers': [
        {'text': 'Iron Man', 'score': 20},
        {'text': 'Cicak Man', 'score': -10},
        {'text': 'Spider Man', 'score': 15},
        {'text': 'Boboboi', 'score': 5},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else
      print('No more questions!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
