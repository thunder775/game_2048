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
