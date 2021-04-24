import 'package:flutter/material.dart';
import 'quizzbrain.dart';
import 'quizEndAlert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
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

List<Icon> correctAnswerIcon = [];
QuizzBrain quizzBrain = new QuizzBrain();
bool userAnswerIs;
bool quizEnded = false;

void checkAnswer(answer) {
  if (quizzBrain.checkCorrectAnswer(answer)) {
    correctAnswerIcon.add(
      Icon(
        Icons.check,
        color: Colors.green,
      ),
    );
  } else {
    correctAnswerIcon.add(
      Icon(
        Icons.clear,
        color: Colors.red,
      ),
    );
  }
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                showQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'New Tegomin',
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Text(
                'True',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal[500]),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                )),
              ),
              onPressed: () {
                setState(() {
                  if (quizEnded) {
                    showAlert(context);
                  } else {
                    checkAnswer(true);
                  }
                });
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Text(
                'False',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.redAccent[400]),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                )),
              ),
              onPressed: () {
                setState(() {
                  if (quizEnded) {
                    showAlert(context);
                  } else {
                    checkAnswer(false);
                  }
                });
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          // Because correctAnswerIcon is a list itself, directly add it's name here
          children: correctAnswerIcon,
        ),
      ],
    );
  }

  String showQuestionText() {
    String text = quizzBrain.getQuestionText();
    if (text == '') {
      quizzBrain.reSetQuiz();
      correctAnswerIcon = [];
      quizEnded = true;
    }
    return text;
  }
}
