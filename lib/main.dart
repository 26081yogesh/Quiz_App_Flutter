import 'package:flutter/material.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quiz_App());

class Quiz_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  QuizBrain quizBrain = new QuizBrain();

  List<Icon> scoreKeeper = [];
  int score = 0;

  void checkAnswer(bool userPickedAnswer) {
    if (scoreKeeper.length == quizBrain.getLength()) {
      Alert(
        onWillPopActive: true,
        closeFunction: () {
          setState(() {
            score = 0;
            scoreKeeper = [];
            quizBrain.resetQuiz();
            Navigator.pop(context);
          });
        },
        context: context,
        title: "Quiz App",
        desc: "Your Score is $score / 10",
        buttons: [
          DialogButton(
            color: Colors.black,
            child: Text(
              "Reset",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              setState(() {
                scoreKeeper = [];
                score = 0;
                quizBrain.resetQuiz();
                Navigator.pop(context);
              });
            },
            width: 120,
          )
        ],
      ).show();
    }
    if (userPickedAnswer == quizBrain.getQuestionAnswer()) {
      setState(() {
        score++;
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      });
    } else {
      setState(() {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      });
    }
    quizBrain.nextQuestion();
  }

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
                quizBrain.getQuestionText(),
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
          child: GestureDetector(
            onTap: () {
              checkAnswer(true);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: Center(
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              checkAnswer(false);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
