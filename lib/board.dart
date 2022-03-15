import 'package:flutter/material.dart';
import 'package:slideit/utils/colors.dart';
import 'package:slideit/widgets/grid.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  int move = 0;
  List<String> items = ['Reset', 'End Game'];
  static const List<int> numbers = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15
  ];
  late var shuffled_numbers = [];

  @override
  void initState() {
    super.initState();
    shuffled_numbers.addAll(numbers);
    shuffled_numbers.shuffle();
    move = 0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print("SHUFFLED : $shuffled_numbers");
    print("NORMAL-- : $numbers");
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            // setState(() {
            //   shuffled_numbers = [
            //     1,
            //     2,
            //     3,
            //     4,
            //     5,
            //     6,
            //     7,
            //     8,
            //     9,
            //     10,
            //     11,
            //     0,
            //     13,
            //     14,
            //     15,
            //     12
            //   ];
            // });
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Level 1",
                  style: TextStyle(
                      fontSize: 32,
                      color: primaryOrange,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Moves : $move",
                  style: const TextStyle(
                    fontSize: 14,
                    color: primaryOrange,
                    fontFamily: "OpenSans",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Grid(
                    numbers: shuffled_numbers,
                    clickGrid: (index) {
                      clickGrid(index);
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primaryBlue),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Quit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: "OpenSans",
                        ),
                      ),
                    ),
                  ),
                ),
                PopupMenuButton(itemBuilder: (context) {
                  var menuItems = items.map((value) {
                    return PopupMenuItem(
                      child: Text(value),
                    );
                  }).toList();
                  menuItems.insert(0, popupTitle());
                  return menuItems;
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  PopupMenuItem popupTitle() {
    return PopupMenuItem(
      child: Text("Title Item"),
    );
  }

  void clickGrid(index) {
    if (index - 1 >= 0 && shuffled_numbers[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 &&
            shuffled_numbers[index + 1] == 0 &&
            (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && shuffled_numbers[index - 4] == 0) ||
        (index + 4 < 16 && shuffled_numbers[index + 4] == 0)) {
      setState(() {
        shuffled_numbers[shuffled_numbers.indexOf(0)] = shuffled_numbers[index];
        shuffled_numbers[index] = 0;
        move = move + 1;
      });
    }
    checkWin();
  }

  void reset() {
    setState(() {
      shuffled_numbers.clear();
      shuffled_numbers.addAll(numbers);
      shuffled_numbers.shuffle();
      move = 0;
    });
  }

  void checkWin() {
    print(isSorted(shuffled_numbers));
    if (isSorted(shuffled_numbers)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Congratulations"),
          content: const Text("You have won the puzzle"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Ok"),
            )
          ],
        ),
      );
    }
  }

  bool isSorted(List list) {
    int prev = list.first;
    for (int i = 1; i < list.length - 1; i++) {
      print(list[i]);
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }
}
