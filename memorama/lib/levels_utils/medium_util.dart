import 'package:flutter/material.dart';

class Game {
  final Color hiddenCard = Colors.red;
  List<Color>? gameColors;
  List<String>? gameImg;
  // List<Color> cards = [
  //   Colors.green,
  //   Colors.yellow,
  //   Colors.yellow,
  //   Colors.green,
  //   Colors.blue,
  //   Colors.blue
  // ];
  final String hiddenCardpath = "assets/hidden.png";
  List<String> cards_list = [
    "assets/food.png",
    "assets/fork.png",
    "assets/home.png",
    "assets/pet.png",
    "assets/spoon.png",
    "assets/walk.png",
    "assets/bird.png",
    "assets/water.png",
    "assets/food.png",
    "assets/fork.png",
    "assets/home.png",
    "assets/pet.png",
    "assets/spoon.png",
    "assets/walk.png",
    "assets/bird.png",
    "assets/water.png",
  ];
  final int cardCount = 16;
  List<Map<int, String>> matchCheck = [];

  //methods
  void initGame() {
    cards_list.shuffle();
    gameColors = List.generate(cardCount, (index) => hiddenCard);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}