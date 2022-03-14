import 'package:flutter/material.dart';
import 'package:slideit/utils/colors.dart';

class GridButton extends StatelessWidget {
  Function onClick;
  String text;
  GridButton({Key? key, required this.onClick, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: primaryBlue,
      onPressed: () {
        onClick();
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
