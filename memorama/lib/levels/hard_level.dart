import 'package:flutter/material.dart';
import 'dart:async';
import '../info.dart';
import '../levels_utils/hard_util.dart';
import 'easy_level.dart';
import 'medium_level.dart';

class Hard extends StatelessWidget {
  const Hard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //setting text style
  TextStyle whiteText = const TextStyle(color: Colors.white);
  Game _game = Game();

  //game stats
  int cardCounter=0;
  int taps = 0;
  bool interaction = true;

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  void disableInteraction(){
    setState(() {
      interaction = false;
    });
    Timer(Duration(seconds: 2),(){
      setState(() {
        interaction = true;
      });
    });
  }

  void resetGame(){
    setState(() {
      _game.initGame();
      cardCounter=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.popUntil(context, (route) => route.isFirst);
                    tries=0;
                    score=0;
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120,40),
                    primary: Colors.purple,
                  ),
                  child: SizedBox(
                    width: 120.0,
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Regresar',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Center(
            child: Text(
              "Memorama",
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          //Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
          //  crossAxisAlignment: CrossAxisAlignment.center,
          //  children: [
          //    info_card("Intento", "$tries"),
          //    info_card("Puntaje", "$score"),
          //  ],
          //),
          Container(
              height: MediaQuery.of(context).size.width+90.0,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  itemCount: _game.gameImg!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  padding: const EdgeInsets.all(16.0),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if(interaction == false){
                          return;
                        }
                        if(_game.checkedCards.contains(_game.gameImg![index])){
                          return;
                        }
                        //print(_game.matchCheck);
                        setState(() {
                          //incrementing the clicks
                          //tries++;
                          taps++;
                          _game.gameImg![index] = _game.cards_list[index];
                          _game.matchCheck
                              .add({index: _game.cards_list[index]});
                          print(_game.matchCheck.first);
                        });
                        if (_game.matchCheck.length == 2) {
                          if (_game.matchCheck[0].values.first ==
                              _game.matchCheck[1].values.first) {
                            print("true");
                            //incrementing the score
                            score += 10;
                            cardCounter++;
                            _game.checkedCards.add(_game.gameImg![index]);
                            _game.matchCheck.clear();
                          } else {
                            print("false");
                            tries++;
                            Future.delayed(Duration(milliseconds: 500), () {
                              print(_game.gameColors);
                              setState(() {
                                _game.gameImg![_game.matchCheck[0].keys.first] =
                                    _game.hiddenCardpath;
                                _game.gameImg![_game.matchCheck[1].keys.first] =
                                    _game.hiddenCardpath;
                                _game.matchCheck.clear();
                              });
                            });
                          }
                        }
                        if(cardCounter==10){
                          Future.delayed(Duration(milliseconds: 2000),(){
                            resetGame();
                          });
                        }
                        if(taps%2 != 0) {
                          disableInteraction();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red.shade300,
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(_game.gameImg![index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  })
          ),
        ],
      ),
    );
  }
}