import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigic_test/utils/app_constants.dart';

import '../widgets/reset_dialog.dart';
import '../widgets/search_dialog.dart';

class BoardScreen extends StatefulWidget {
  final Map<String, dynamic> pageData;

  const BoardScreen({Key? key, required this.pageData}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  String? search;

  int xAxis = 0;
  int yAxis = 0;
  String message = "";

  @override
  void initState() {
    message = widget.pageData["message"];
    xAxis = widget.pageData["xAxis"];
    yAxis = widget.pageData["yAxis"];
    super.initState();
  }

  List<List<String>> convertTo2D() {
    List<List<String>> grid = [];
    for (var i = 0; i < message.length; i += yAxis) {
      grid.add(getList(message).sublist(i, i + yAxis > message.length ? message.length : i + yAxis));
    }
    return grid;
  }

  List<String> getList(String? message) {
    if (message != null && message.isNotEmpty) {
      var list = <String>[];
      for (int i = 0; i < message.length; i++) {
        list.add(message[i]);
      }
      return list;
    } else {
      return [];
    }
  }

  static List<int> x = [-1, -1, -1, 0, 0, 1, 1, 1];
  static List<int> y = [-1, 0, 1, -1, 1, -1, 0, 1];
  searchDirection(List<List<String>> grid, String word, int row, int col) {
    // If first character of word
    // doesn't match with
    // given starting point in grid.
    if (grid[row][col] != word[0]) {
      return;
    }
    int len = word.length;
    // Search word in all 8 directions
    // starting from (row, col)
    List points = [];
    points.add('$row,$col');
    for (int dir = 0; dir < 8; dir++) {
      if (dir == 0 || dir == 1 || dir == 2 || dir == 3 || dir == 5) {
        continue;
      }

      // Initialize starting point
      // for current direction
      int k;
      int cd = col + y[dir];
      int rd = row + x[dir];

      // First character is already checked,
      // match remaining characters
      for (k = 1; k < len; k++) {
        // If out of bound break
        if (rd >= xAxis || rd < 0 || cd >= yAxis || cd < 0) {
          if (points.isNotEmpty) {
            var temp = points.first;
            points.clear();
            points.add(temp);
          }
          break;
        }

        // If not matched, break

        if (grid[rd][cd] != word[k]) {
          if (points.isNotEmpty) {
            var temp = points.first;
            points.clear();
            points.add(temp);
          }
          break;
        }

        // Moving in particular direction
        points.add('$rd,$cd');
        rd += x[dir];
        cd += y[dir];
      }

      // If all character matched,
      // then value of must
      // be equal to length of word
      if (k == len) {
        return points;
      }
    }
  }

  List points = [];

  searchWord(String word) {
    points.clear();
    List<List<String>> grid = convertTo2D();
    // for (var element in grid) {
    //   log("$element", name: "${grid.indexOf(element)}");
    // }

    for (int row = 0; row < xAxis; row++) {
      for (int col = 0; col < yAxis; col++) {
        if (grid[row][col] == word[0]) {
          log("$row $col");
          var data = searchDirection(grid, word, row, col);
          if (data != null) {
            points.add(data);
          }
        }
      }
    }

    result.clear();
    for (var element in points) {
      for (var point in element) {
        get1dFrom2d(point);
      }
    }
    for (var element in result) {
      log(element.toString());
    }
    setState(() {});
    if (points.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$word Not Found")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$word Found ${points.length} times")));
    }
  }

  List result = [];
  get1dFrom2d(String point) {
    int x = int.parse(point.split(',').first);
    int y = int.parse(point.split(',').last);
    // int count = 0;

    // for (var i = 0; i < xAxis; i++) {
    //   log(i.toString());
    //   for (var j = 0; j < yAxis; j++) {
    //     log(j.toString());
    //     count++;

    //     if (x == i && y == j) {
    //       break;
    //     }
    //   }
    // }
    // log("count $count");
    var i = x * yAxis + y;
    result.add(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Board Screen",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
              ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const ResetDialog();
                },
              ).then((value) {
                if (value ?? false) {
                  Get.offNamed('/rowColumnSelectorScreen');
                }
              });
            },
            icon: const Icon(Icons.restart_alt),
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const SearchDialog(),
              ).then(
                (value) {
                  if (value != null) {
                    search = value.toString().toLowerCase();
                    searchWord(search!);
                  }
                },
              );
            },
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          Card(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color(0xFF0F2027),
                  Color(0xFF203A43),
                  Color(0xFF2C5364),
                ]),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[100],
                  ),
                  child: ListTile(
                    isThreeLine: true,
                    title: Column(
                      children: [
                        Text(
                          "Grid Size $xAxis Rows x $yAxis Columns",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        if (search != null) const Divider(),
                      ],
                    ),
                    subtitle: Column(
                      children: [
                        const SizedBox(height: 10),
                        if (search != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                            child: Text(
                              "The text you searched is: $search",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          if (search == null) const SizedBox(height: 10),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: ColoredBox(
                  color: Colors.white /*Theme.of(context).primaryColor*/,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: (xAxis * yAxis),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: yAxis,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                      ),
                      itemBuilder: (context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: getBoxColor(index),
                            border: Border.all(color: getBorderColor(index)),
                          ),
                          child: Center(
                            child: Text(
                              message[index],
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: getFontSizeByxAxis(),
                                    fontWeight: FontWeight.w400,
                                    color: getTextColor(index),
                                  ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  getFontSizeByxAxis() {
    if (xAxis < 10) {
      return 20.0;
    } else if (xAxis < 15) {
      return 16.0;
    } else {
      return 12.0;
    }
  }

  Color getTextColor(int index) {
    if (result.contains(index)) {
      return Colors.white;
    }
    return Colors.black;
  }

  Color getBorderColor(int index) {
    if (result.contains(index)) {
      return Colors.white;
    }
    return Colors.grey.shade300;
  }

  Color getBoxColor(int index) {
    if (result.contains(index)) {
      return AppConstants.appGreen;
    }
    return Colors.white;
  }
}
