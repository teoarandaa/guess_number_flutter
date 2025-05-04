import 'dart:math';
import 'mark.dart';

class Game {
  static final int MIN_VALUE = 0;
  static final int MAX_VALUE = 100;

  int _targetValue = 0;
  int _points = 0;
  int _score = 0;
  int _rounds = 0;  
  List<Mark> _marks = [];

  int get score => _score;
  int get rounds => _rounds;
  int get targetValue => _targetValue;
  int get points => _points;
  List<Mark> get marks => _marks;

  Game() {
    _targetValue = Random().nextInt(MAX_VALUE + 1 - MIN_VALUE) + MIN_VALUE;
  }

  void calculatePoints(double sliderValue) {
    int sliderValueInt = sliderValue.round().toInt();
    int difference = (_targetValue - sliderValueInt).abs();
    _points = (MAX_VALUE - difference);
    _score += _points;
    _rounds++;
  }

  void saveScore() {
    _marks.add(Mark(score: _score, dateTime: DateTime.now()));
    _marks.sort((a, b) => b.score.compareTo(a.score)); // Sort in descending order
    if (_marks.length > 5) {
      _marks = _marks.sublist(0, 5); // Keep only top 5 scores
    }
  }

  void reset() {
    _targetValue = Random().nextInt(MAX_VALUE + 1 - MIN_VALUE) + MIN_VALUE;
    _points = 0;
  }

  void restartGame() {
    saveScore(); // Save the previous game's score before restarting
    _targetValue = Random().nextInt(MAX_VALUE + 1 - MIN_VALUE) + MIN_VALUE;
    _points = 0;
    _score = 0;
    _rounds = 0;
  }
}
