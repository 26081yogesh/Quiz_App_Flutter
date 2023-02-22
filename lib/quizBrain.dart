import 'question.dart';

class QuizBrain {
  int _qno = 0;

  List<Question> _questionBank = [
    Question(
        questionText: 'Mark Zukerberg founded facebook', questionAnswer: true),
    Question(
        questionText: 'Shangai is the capital of China', questionAnswer: false),
    Question(
        questionText: 'First indian to go in space was Rakesh Sharma',
        questionAnswer: true),
    Question(
        questionText: 'React Native is developed by Google',
        questionAnswer: false),
    Question(
        questionText: 'Capital of Haryana is Chandigarh', questionAnswer: true),
    Question(
        questionText:
            'VIT university stands for Vellore Institute Of Technology',
        questionAnswer: true),
    Question(
        questionText: 'GTA stands for Grand Thief Auto', questionAnswer: false),
    Question(
        questionText: 'Ancient name of Delhi is Indraprasth',
        questionAnswer: true),
    Question(
        questionText: 'Raja Harishchandra was first bollywood movie',
        questionAnswer: true),
  ];

  void resetQuiz() {
    _qno = 0;
  }

  int getLength() {
    return _questionBank.length;
  }

  void nextQuestion() {
    if (_qno < _questionBank.length - 1) {
      _qno++;
    }
  }

  String getQuestionText() {
    return _questionBank[_qno].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_qno].questionAnswer;
  }
}
