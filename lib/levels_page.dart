import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slideit/utils/colors.dart';

class LevelsPage extends StatelessWidget {
  const LevelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.1,
                    0.9,
                  ],
                  colors: [
                    Color.fromRGBO(241, 227, 221, 0.9),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 0,
              child: Opacity(
                opacity: 0.2,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  child: SvgPicture.asset('assets/images/top-boxes.svg'),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Level.It",
                      style: TextStyle(
                          color: primaryBlue,
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          fontFamily: "OpenSans")),
                  Text(
                    "Level up and challenge yourself...",
                    style: TextStyle(
                      color: primaryOrange,
                      fontSize: 12,
                      fontFamily: "OpenSans",
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              child: Opacity(
                opacity: 0.2,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  child: SvgPicture.asset('assets/images/bottom-boxes.svg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
