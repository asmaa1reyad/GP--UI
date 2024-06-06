import 'package:flutter/material.dart';
import 'package:foodhub/Widgets/card02.dart';

class TopList3 extends StatelessWidget {
  const TopList3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          card02(
            image: "assets/images/pastah.jpg",
            Rating: "\LE  4.3 ",
            mainText: "pasta ",
          ),
          const SizedBox(
            width: 10,
          ),
          card02(
            image: "assets/images/burgerh.jpg",
            Rating: "\LE 4.3 ",
            mainText: "burger ",
          ),
        ]),
      ),
    );
  }
}
