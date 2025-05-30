import 'package:flutter/material.dart';
import 'package:flutter_guess_the_number/game.dart';
import 'package:flutter_guess_the_number/mark.dart';

class ViewModel extends ChangeNotifier {
  final Game _game = Game();


  int get score => _game.score;
  int get rounds => _game.rounds;
  int get targetValue => _game.targetValue;
  int get points => _game.points;
  List<Mark> get marks => _game.marks;

  void calculatePoints(double sliderValue) {
    _game.calculatePoints(sliderValue);
    notifyListeners();
  }

  void saveScore() {
    _game.saveScore();
    notifyListeners();
  }

  void reset() {
    _game.reset();
    notifyListeners();
  }
  
  void restartGame() {
    _game.restartGame();
    notifyListeners();
  }
}