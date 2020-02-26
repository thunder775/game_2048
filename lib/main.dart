import 'package:flutter/material.dart';
import 'package:game_2048/logic_class.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GameLogic logic = GameLogic();

  @override
  void initState() {
    print(logic.board);
    // TODO: implement initState
    super.initState();
  }

  double startY;
  double endY;
  double startX;
  double endX;

  List<List<int>> updateBoardUpAndDown(
      List<List<int>> board, double difference) {
    if (difference < 0) {
      board = logic.downSlideBoard(board);
    } else {
      board = logic.upSlideBoard(board);
    }
    logic.getRandomTwo(board);
    return board;
  }

  List<List<int>> updateBoardLeftAndRight(
      List<List<int>> board, double difference) {
    if (difference < 0) {
      board = logic.rightSlideBoard(board);
    } else {
      board = logic.leftSlideBoard(board);
    }
    logic.getRandomTwo(board);
    return board;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("2048")),
      ),
      body: GestureDetector(
        onVerticalDragStart: (dre) {
          startY = dre.globalPosition.dy;
        },
        onVerticalDragUpdate: (dre) {
          endY = dre.globalPosition.dy;
        },
        onVerticalDragEnd: (dre) {
          logic.board = updateBoardUpAndDown(logic.board, startY - endY);
          setState(() {});
        },
        onHorizontalDragStart: (dre) {
          startX = dre.globalPosition.dx;
        },
        onHorizontalDragUpdate: (dre) {
          endX = dre.globalPosition.dx;
        },
        onHorizontalDragEnd: (dre) {
          logic.board = updateBoardLeftAndRight(logic.board, startX - endX);
          setState(() {});
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 70,
                          width: 70,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              '${logic.board[0][0]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              '${logic.board[0][1]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              '${logic.board[0][2]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              '${logic.board[0][3]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 70,
                          width: 70,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              '${logic.board[1][0]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              '${logic.board[1][1]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              '${logic.board[1][2]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              '${logic.board[1][3]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 70,
                          width: 70,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              '${logic.board[2][0]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              '${logic.board[2][1]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              '${logic.board[2][2]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              '${logic.board[2][3]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 70,
                          width: 70,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              '${logic.board[3][0]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              '${logic.board[3][1]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              '${logic.board[3][2]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              '${logic.board[3][3]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16, bottom: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    child: Icon(Icons.keyboard_arrow_up),
                    onPressed: () {
                      logic.board = logic.upSlideBoard(logic.board);
                      logic.getRandomTwo(logic.board);
                      setState(() {});
                    },
                    heroTag: "up",
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.keyboard_arrow_down),
                    onPressed: () {
                      logic.board = logic.downSlideBoard(logic.board);
                      logic.getRandomTwo(logic.board);
                      setState(() {});
                    },
                    heroTag: "down",
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.chevron_left),
                    onPressed: () {
                      logic.board = logic.leftSlideBoard(logic.board);
                      logic.getRandomTwo(logic.board);
                      setState(() {});
                    },
                    heroTag: "left",
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.chevron_right),
                    onPressed: () {
                      logic.board = logic.rightSlideBoard(logic.board);
                      logic.getRandomTwo(logic.board);
                      setState(() {});
                    },
                    heroTag: "right",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum Moves { Right, Left, Up, Down }
