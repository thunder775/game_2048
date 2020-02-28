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
    logic.addRandomTwo(logic.board);
    // TODO: implement initState
    super.initState();
  }

  double startY;
  double endY;
  double startX;
  double endX;

  List<List<int>> updateBoard(List<List<int>> board, double differenceX,
      double differenceY, BuildContext context) {
    List<List<int>> beforeMove = List.from(board);

    if (differenceX.abs() > differenceY.abs()) {
      if (differenceX < 0) {
        board = logic.rightSlideBoard(board);
      } else {
        board = logic.leftSlideBoard(board);
      }
    } else {
      if (differenceY < 0) {
        board = logic.downSlideBoard(board);
      } else {
        board = logic.upSlideBoard(board);
      }
    }
    if (!logic.areMatricesEqual(beforeMove, board)) {
      logic.addRandomTwo(board);
    }
    if (logic.isGameOver(board)) {
      print('overrrrr');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Game Over!"),
              actions: <Widget>[
                Center(
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      board = [
                        [0, 0, 0, 0],
                        [0, 0, 0, 0],
                        [0, 0, 0, 0],
                        [0, 0, 0, 0]
                      ];
                      logic.addRandomTwo(board);

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
    print(board);
    return board;
  }

  Widget getRow(List<int> row) {
    List<Widget> list = row.map((element) {
      return Container(
        height: 70,
        width: 70,
        color: Colors.orange.withOpacity(double.parse('0.$element')),
        child: Center(
          child: Text(
            '$element',
            style: TextStyle(
                color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }).toList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: list,
      ),
    );
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
          logic.board =
              updateBoard(logic.board, startX - endX, startY - endY, context);
          setState(() {});
        },
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    getRow(logic.board[0]),
                    getRow(logic.board[1]),
                    getRow(logic.board[2]),
                    getRow(logic.board[3]),
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
