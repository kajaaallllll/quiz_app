import 'package:flutter/material.dart';
import 'package:quizzie_app/answer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;



  void _questionAnswered(bool answerScore) {
    setState(() {

      answerWasSelected = true;

      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }

      _scoreTracker.add(
        answerScore
            ? Icon(
          Icons.check_circle,
          color: Colors.green,
        )
            : Icon(
          Icons.clear,
          color: Colors.red,
        ),
      );

      if (_questionIndex + 1 == _questions.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });

    if (_questionIndex >= _questions.length) {
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _scoreTracker = [];
      endOfQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          'Physics Questions',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body:
      Center(
        child: Column(
          children: [

            Row(
              children: [
                if (_scoreTracker.length == 0)
                 const SizedBox(
                    height: 25.0,
                  ),
                if (_scoreTracker.length > 0) ..._scoreTracker
              ],
            ),
            Container(
              width: double.infinity,
              height: 130.0,
              margin: EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  _questions[_questionIndex]['question'].toString(),
                  textAlign: TextAlign.center,
                  style:const  TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ...(_questions[_questionIndex]['answers']
            as List<Map<String, dynamic>>)
                .map(
                  (answer) => Answer(
                answerText: answer['answerText'],
                    answerColor: answerWasSelected
                        ? answer['score']
                        ? Colors.green
                        : Colors.red
                        : null,
                answerTap: () {

                  if (answerWasSelected) {
                    return;
                  }

                  _questionAnswered(answer['score']);
                },
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(

              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 40.0),
              ),
              onPressed: () {
                if (!answerWasSelected) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Please select an answer before going to the next question'),
                  ));
                  return;
                }
                _nextQuestion();
              },
              child: Text(endOfQuiz ? 'Restart Quiz' : 'Next Question'),
            ),
            Container(

              padding: EdgeInsets.all(20.0),
              child: Text(
                '${_totalScore.toString()}/${_questions.length}',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
            if (answerWasSelected && !endOfQuiz)
              Container(
                height: 100,
                width: double.infinity,
                color: correctAnswerSelected ? Colors.green : Colors.red,
                child: Center(
                  child: Text(
                    correctAnswerSelected
                        ? 'Well done, you got it right!'
                        : 'Wrong :/',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            if (endOfQuiz)
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.black,
                child: Center(
                  child: Text(
                    _totalScore > 4
                        ? 'Congratulations! Your final score is: $_totalScore'
                        : 'Your final score is: $_totalScore. Better luck next time!',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: _totalScore > 4 ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

final _questions = const [
  {
    'question': 'The force per unit charge is known as?',
    'answers': [
      {'answerText': 'electric field', 'score': true},
      {'answerText': 'electric flux', 'score': false},
      {'answerText': ' electric current', 'score': false},
    ],
  },
  {
    'question':
    'Electric field lines provide information about',
    'answers': [
      {'answerText': 'N C m-2', 'score': false},
      {'answerText': ' N C-2 m2', 'score': false},
      {'answerText': '  N C-1 m2', 'score': true},
    ],
  },
  {
    'question': 'The unit of electric dipole moment is',
    'answers': [
      {'answerText': 'newton', 'score': false},
      {'answerText': ' coulomb', 'score': false},
      {'answerText': 'debye', 'score': true},
    ],
  },
  {
    'question': 'SI unit of permittivity of free space is',
    'answers': [
      {'answerText': 'Weber', 'score': false},
      {'answerText': ' C2N-1 m-2', 'score': true},
      {'answerText': 'Farad', 'score': false},
    ],
  },
  {
    'question':
    'Which part of his body did musician Gene Simmons from Kiss insure for one million dollars?',
    'answers': [
      {'answerText': 'His tongue', 'score': true},
      {'answerText': 'His leg', 'score': false},
      {'answerText': 'His butt', 'score': false},
    ],
  },
  {
    'question': 'Alternating voltage (V) is represented by the equation',
    'answers': [
      {'answerText': ' V(t) = Vm sin ωt', 'score': true},
      {'answerText': ' V(t) = Vm eωt', 'score': false},
      {'answerText': 'V(t) = Vm tan ωt', 'score': false},
    ],
  },
  {
    'question': 'In the case of an inductor',
    'answers': [
      {'answerText': 'voltage leads the current by π2', 'score': true},
      {'answerText': 'voltage leads the current by  π3', 'score': false},
      {'answerText': 'voltage lags the current by π2', 'score': false},
    ],
  },
  {
    'question': 'In a pure capacitive circuit if the frequency of ac source is doubled, then its capacitive reactance will be',
    'answers': [
      {'answerText': ' zero', 'score': false},
      {'answerText': 'doubleds', 'score': false},
      {'answerText': 'halved', 'score': true},
    ],
  },
  {
    'question': 'In which of the following circuits the maximum power dissipation is observed?',
    'answers': [
      {'answerText': 'Pure capacitive circuit', 'score': false},
      {'answerText': ' Pure inductive circuit', 'score': false},
      {'answerText': 'Pure resistive circuit', 'score': true},
    ],
  },
];




