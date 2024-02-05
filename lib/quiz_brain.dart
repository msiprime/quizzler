import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  int _questionNumber = 0;

  Icon correct = const Icon(
    Icons.check,
    color: Colors.green,
  );
  Icon wrong = const Icon(
    Icons.close,
    color: Colors.red,
  );

  List<Widget> scoreKeeper = [];

  final List<Question> _questionBank = [
    Question('Ayrin Loves MsI', true),
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was "Moon".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called "Back-rub".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void questionChecker(bool flag) {
    bool correctAnswer = getAnswer();
    if (correctAnswer == flag) {
      scoreKeeper.add(correct);
    } else {
      scoreKeeper.add(wrong);
    }
  }

  void nextQuestion(context) {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    } else {
      _questionNumber = 0;
      scoreKeeper.clear();
      Alert(
          context: context,
          title: "END OF THE QUIZ",
          desc: "Congratulations, You have finished the quiz! See you Again 🙂",
          style: const AlertStyle(
            backgroundColor: Colors.teal,
            alertBorder:Border(),
            animationType: AnimationType.fromTop,
          ),
      ).show();
    }
  }

  String getQuestionText() => _questionBank[_questionNumber].question;

  bool getAnswer() => _questionBank[_questionNumber].answer;
}
