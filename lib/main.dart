import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Icon correct = const Icon(
    Icons.check,
    color: Colors.green,
  );
  Icon wrong = const Icon(
    Icons.close,
    color: Colors.red,
  );
  int questionNumber = 0;

  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
    'Ayrin is ula ula lala lala',
    'Rakib is chacha chacha cha cha cha',
    'vombol das vombol das',
    'A E I O U are vowels'
  ];
  List<Widget> scoreKeeper = [];
  List<bool> answers = [true, false, true, false, true, true];
  Question q1 =
      Question('You can lead a cow down stairs but not up stairs.', true);
  Question q2 = Question(
      'Approximately one quarter of human bones are in the feet.', false);
  Question q3 = Question('A slug\'s blood is green.', true);
  Question q4 = Question('Ayrin is ula ula lala lala', true);
  Question q5 = Question('vombol das vombol das', true);
  Question q6 = Question('Rakib is chacha chacha cha cha cha', true);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  questions[questionNumber],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: const Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
                onPressed: () {
                  bool correctAnswer = answers[questionNumber];
                  if (correctAnswer == true) {
                    scoreKeeper.add(correct);
                  } else {
                    scoreKeeper.add(wrong);
                  }
                  setState(() {
                    questionNumber++;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: const Text(
                  'False',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  bool correctAnswer = answers[questionNumber];
                  if (correctAnswer == false) {
                    scoreKeeper.add(correct);
                  } else {
                    scoreKeeper.add(wrong);
                  }
                  setState(() {
                    questionNumber++;
                  });
                },
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}
