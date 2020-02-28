import 'dart:math';

class GameLogic {
  List<List<int>> board = [
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0]
  ];

  List<int> leftSlide(List<int> row) {
    List<int> output = [];
    output = row.where((item) => item != 0).toList();
    for (int i = 0; i < output.length - 1; i++) {
      if (output[i] == output[i + 1]) {
        output[i] += output[i + 1];
        output.removeAt(i + 1);
      }
    }
    int outputLength = output.length;
    for (int i = 0; i < row.length - outputLength; i++) {
      output.add(0);
    }
    return output;
  }

  List<int> rightSlide(List<int> row) {
    row = row.reversed.toList();
    row = leftSlide(row);
    row = row.reversed.toList();
    return row;
  }

  List<List<int>> transpose(List<List<int>> matrix) {
    List<List<int>> output = [];
    matrix.forEach((x) => output.add([]));
    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[i].length; j++) {
        output[j].add(matrix[i][j]);
      }
    }
    return output;
  }

  List<List<int>> leftSlideBoard(List<List<int>> board) {
    List<List<int>> output = [];
    board.forEach((row) => output.add(leftSlide(row)));
    return output;
  }

  List<List<int>> rightSlideBoard(List<List<int>> board) {
    List<List<int>> output = [];
    board.forEach((row) => output.add(rightSlide(row)));
    return output;
  }

  List<List<int>> upSlideBoard(List<List<int>> board) {
    board = transpose(board);
    board = leftSlideBoard(board);
    board = transpose(board);
    return board;
  }

  List<List<int>> downSlideBoard(List<List<int>> board) {
    board = transpose(board);
    board = rightSlideBoard(board);
    board = transpose(board);
    return board;
  }

  bool containsZero(List<List<int>> matrix) {
    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[i].length; j++) {
        if (board[i][j] == 0) {
          return true;
        }
      }
    }
    return false;
  }

  bool areMovesAvailable(List<List<int>> matrix) {
    List<List<int>> beforeMove = List.from(matrix);
    matrix = leftSlideBoard(matrix);
    matrix = rightSlideBoard(matrix);
    matrix = upSlideBoard(matrix);
    matrix = downSlideBoard(matrix);
    return !areMatricesEqual(beforeMove, matrix);
  }

  bool areMatricesEqual(List<List<int>> matrix1, List<List<int>> matrix2) {
    for (int i = 0; i < matrix1.length; i++) {
      for (int j = 0; j < matrix1[i].length; j++) {
        if (matrix1[i][j] != matrix2[i][j]) {
          return false;
        }
      }
    }
    return true;
  }

  bool isGameOver(List<List<int>> matrix) {
    return areMovesAvailable(matrix) || containsZero(matrix) ? false : true;
  }
  final _random = new Random();

  void addRandomTwo(List<List<int>> board) {
    List<List<int>> potentialPlaces = [];
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        if (board[i][j] == 0) {
          potentialPlaces.add([i, j]);
        }
      }
    }
    if (potentialPlaces.length == 0) {
      return;
    }
    int randomIndex = _random.nextInt(potentialPlaces.length);
    board[potentialPlaces[randomIndex][0]][potentialPlaces[randomIndex][1]] = 2;
  }

  bool isGameWon(matrix) {
    bool result = false;
    matrix.forEach((row) {
      row.forEach((ele) {
        if (ele == 2048) {
          result = true;
        }
      });
    });
    return result;
  }
}

void main() {
  GameLogic helper = GameLogic();
  helper.transpose(helper.board);
//  print(helper.leftSlide([2, 2, 2, 0]));
//  print(helper.leftSlide([4, 0, 0, 4]));
//  print(helper.leftSlide([2, 2, 4, 4, 8, 8]));
//  print(helper.rightSlide([2, 2, 2, 0]));
//  print(helper.rightSlide([4, 0, 0, 4]));
//  print(helper.rightSlide([2, 2, 4, 4, 8, 8]));
//  print(helper.rightSlide([8, 4, 4, 8]));
//  print(helper.leftSlide([8, 4, 4, 8]));
}
