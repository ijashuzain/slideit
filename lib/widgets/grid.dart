import 'package:flutter/material.dart';
import 'package:slideit/widgets/grid_button.dart';

class Grid extends StatelessWidget {
  var numbers = [];
  Function clickGrid;

  Grid({
    Key? key,
    required this.numbers,
    required this.clickGrid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.60,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return numbers[index] != 0
                ? GridButton(
                    onClick: () {
                      clickGrid(index);
                    },
                    text: numbers[index].toString(),
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
