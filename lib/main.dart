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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  GameLogic logic = GameLogic();
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    logic.addRandomTwo(logic.board);
    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
    super.initState();
  }

  Offset start = Offset(-4, 0);
  Offset end = Offset(4, 0);
  double startY;
  double endY;
  double startX;
  double endX;

  List<List<int>> updateBoard(
      List<List<int>> board, double differenceX, double differenceY) {
    List<List<int>> beforeMove = List.from(board);

    if (differenceX.abs() > differenceY.abs()) {
      board = logic.performHorizontalMove(
          board, differenceX < 0 ? logic.rightSlide : logic.leftSlide);
      if (differenceX < 0) {
        start = Offset(-4, 0);
        end = Offset(4, 0);
      } else {
        start = Offset(4, 0);
        end = Offset(-4, 0);
      }
    } else {
      board = logic.performVerticalMove(
          board, differenceY < 0 ? logic.rightSlide : logic.leftSlide);
      if (differenceY < 0) {
        start = Offset(0, -3);
        end = Offset(0, 3);
      } else {
        start = Offset(0, 3);
        end = Offset(0, -3);
      }
    }
    if (!logic.areMatricesEqual(beforeMove, board)) {
      logic.addRandomTwo(board);
    }
    return board;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(child: Text("2048")),
      ),
      body: GestureDetector(
        onPanStart: (dre) {
          startX = dre.globalPosition.dx;
          startY = dre.globalPosition.dy;
        },
        onPanUpdate: (dre) {
          endX = dre.globalPosition.dx;
          endY = dre.globalPosition.dy;
        },
        onPanEnd: (dre) {
          logic.board = updateBoard(logic.board, startX - endX, startY - endY);
          if (logic.isGameOver(logic.board)) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Game Over!"),
                    actions: <Widget>[
                      Center(
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            logic.resetBoard();
                            setState(() {});
                            Navigator.pop(context);
                          },
                          label: Text("Try Again"),
                          heroTag: "reset",
                          backgroundColor: Colors.orange,
                          icon: Icon(Icons.refresh),
                        ),
                      )
                    ],
                  );
                });
          }
          setState(() {
            animationController.forward(from: 0);
          });
        },
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('${logic.moveCount}'),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AnimatedContainer(
                          element: logic.board[0][0],
                          controller: animationController,
                          end: end,
                          start: start,
                        ),
                        AnimatedContainer(
                          element: logic.board[0][1],
                          controller: animationController,
                          end: end,
                          start: start,
                        ),
                        AnimatedContainer(
                          element: logic.board[0][2],
                          controller: animationController,
                          end: end,
                          start: start,
                        ),
                        AnimatedContainer(
                          element: logic.board[0][3],
                          controller: animationController,
                          end: end,
                          start: start,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AnimatedContainer(
                          element: logic.board[1][0],
                          controller: animationController,
                          end: end,
                          start: start,
                        ),
                        AnimatedContainer(
                          element: logic.board[1][1],
                          controller: animationController,
                          end: end,
                          start: start,
                        ),
                        AnimatedContainer(
                          element: logic.board[1][2],
                          controller: animationController,
                          end: end,
                          start: start,
                        ),
                        AnimatedContainer(
                          element: logic.board[1][3],
                          controller: animationController,
                          end: end,
                          start: start,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AnimatedContainer(
                          element: logic.board[2][0],
                          controller: animationController,
                          end: end,
                          start: start,
                        ),
                        AnimatedContainer(
                          element: logic.board[2][1],
                          controller: animationController,
                          end: end,
                          start: start,
                        ),
                        AnimatedContainer(
                          element: logic.board[2][2],
                          controller: animationController,
                          end: end,
                          start: start,
                        ),
                        AnimatedContainer(
                          element: logic.board[2][3],
                          controller: animationController,
                          end: end,
                          start: start,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AnimatedContainer(
                          element: logic.board[3][0],
                          controller: animationController,
                          end: end,
                          start: start,
                        ),
                        AnimatedContainer(
                          element: logic.board[3][1],
                          controller: animationController,
                          end: end,
                          start: start,
                        ),
                        AnimatedContainer(
                          element: logic.board[3][2],
                          controller: animationController,
                          end: end,
                          start: start,
                        ),
                        AnimatedContainer(
                          element: logic.board[3][3],
                          controller: animationController,
                          end: end,
                          start: start,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedContainer extends StatefulWidget {
  int element;
  Offset start;
  Offset end;
  AnimationController controller;

  AnimatedContainer({this.element, this.controller, this.end, this.start});

  @override
  _AnimatedContainerState createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<AnimatedContainer> {
  int oldVal;

  @override
  void initState() {
    // TODO: implement initState
    oldVal = widget.element;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.addListener(() {
      if (widget.controller.isCompleted) {
        oldVal = widget.element;
      }
    });
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 70,
        width: 70,
        color: kColorsMap[widget.element],
        child: Center(
          child: Stack(
            children: <Widget>[
              SlideTransition(
                position: Tween(begin: Offset(0, 0), end: widget.end).animate(
                    CurvedAnimation(
                        parent: widget.controller, curve: Curves.linear)),
                child: Text(
                  '$oldVal',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SlideTransition(
                position: Tween(begin: widget.start, end: Offset(0, 0)).animate(
                    CurvedAnimation(
                        parent: widget.controller, curve: Curves.linear)),
                child: Text(
                  '${widget.element}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Map<int, Color> kColorsMap = {
  0: Colors.orange.shade100,
  2: Colors.orange.shade200,
  4: Colors.orange.shade300,
  8: Colors.orange.shade400,
  16: Colors.orange.shade500,
  32: Colors.orange.shade600,
  64: Colors.orange.shade600,
  128: Colors.orange.shade700,
  256: Colors.blue.shade700,
  512: Colors.blue.shade800,
  1024: Colors.blue.shade800,
  2048: Colors.blue.shade900,
};
