import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slideit/board.dart';
import 'package:slideit/utils/colors.dart';

class StarterPage extends StatelessWidget {
  const StarterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 10,
            right: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
              child: SvgPicture.asset('assets/images/top-boxes.svg'),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 100,
            left: 20,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Slide.It",
                      style: TextStyle(
                          color: primaryBlue,
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          fontFamily: "OpenSans")),
                  const Text("Never let the game play you...",
                      style: TextStyle(
                          color: primaryOrange,
                          fontSize: 12,
                          fontFamily: "OpenSans")),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Board(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: primaryBlue),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text("Let's Slide it",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: "OpenSans")),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
              child: SvgPicture.asset('assets/images/bottom-boxes.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
