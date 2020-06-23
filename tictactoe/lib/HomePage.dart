import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO: link up all images
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage cross = AssetImage('images/cross.png');
  AssetImage edit = AssetImage('images/edit.png');

  bool isCross = true;
  String message;
  List<String> gameState;

  //TODO: initialize state with empty box
  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
      ];
      this.message = '';
    });
  }

  // TODO playGame method
  playGame(int index) {
    if (this.gameState[index] == 'empty') {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = 'cross';
        } else {
          this.gameState[index] = 'circle';
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  //TODO reset game method
  resetGame() {
    setState(() {
      this.gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
      ];
      this.message = '';
    });
  }

  // TODO getImages method
  AssetImage getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('circle'):
        return circle;
        break;
      case ('cross'):
        return cross;
        break;
    }
  }

  //TODO reset game automatically when someone wins
  automaticReset() {
    Timer(Duration(seconds: 2), () {
      resetGame();
    });
  }

  //TODO Check winning logic
  checkWin() {
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = '${gameState[0]} Wins';
        automaticReset();
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = '${gameState[3]} Wins';
        automaticReset();
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = "${gameState[6]} Wins";
        automaticReset();
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = '${gameState[0]} Wins';
        automaticReset();
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = '${gameState[1]} Wins';
        automaticReset();
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = '${gameState[2]} Wins';
        automaticReset();
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = '${gameState[0]} Wins';
        automaticReset();
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4]) == gameState[6]) {
      setState(() {
        this.message = '${gameState[2]} Wins';
        automaticReset();
      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        this.message = 'Game Draw';
        automaticReset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.all(20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: gameState.length,
                  itemBuilder: (BuildContext context, i) => SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child: MaterialButton(
                          onPressed: () {
                            this.playGame(i);
                          },
                          child: Image(image: this.getImage(this.gameState[i])),
                        ),
                      ))),
          Container(
            padding: EdgeInsets.all(30),
            child: Text(
              this.message,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: MaterialButton(
              onPressed: resetGame,
              color: Colors.purple,
              minWidth: 300,
              height: 50,
              child: Text(
                'Reset Game!',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
          )
        ],
      ),
    );
  }
}
