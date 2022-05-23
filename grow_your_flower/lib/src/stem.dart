import 'package:flutter/material.dart';
import 'package:grow_your_flower/data/thousand.dart';

import 'package:grow_your_flower/data/calcprice.dart';

class StemData {
  final int typeStem;
  final int gradeStem;
  int levelStem;

  StemData({
    required this.typeStem,
    required this.gradeStem,
    required this.levelStem,
  });
}

class Stem extends StatelessWidget {
  List<StemData> stemData = [
    StemData(typeStem: 0, gradeStem: 0, levelStem: 1),
    // StemData(typeStem: 0, gradeStem: 1, levelStem: 75),
    // StemData(typeStem: 0, gradeStem: 2, levelStem: 53),
    // StemData(typeStem: 0, gradeStem: 3, levelStem: 23),
    // StemData(typeStem: 0, gradeStem: 4, levelStem: 11),
    // StemData(typeStem: 0, gradeStem: 5, levelStem: 1),
  ];

  Stem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> listStemData = stemData
        .map((StemData stem) => StemMenu(
            typeStem: stem.typeStem,
            gradeStem: stem.gradeStem,
            levelStem: stem.levelStem))
        .toList();

    return Column(
      verticalDirection: VerticalDirection.up,
      children: listStemData,
    );
  }
}

class StemMenu extends StatefulWidget {
  final int typeStem;
  final int gradeStem;
  int levelStem;

  StemMenu({
    Key? key,
    required this.typeStem,
    required this.gradeStem,
    required this.levelStem,
  }) : super(key: key);

  @override
  State<StemMenu> createState() => _StemMenuState();
}

class _StemMenuState extends State<StemMenu> {
  double mining = 0.0;
  double price = 0.0;
  double stemWidth = 0.0;
  dynamic stemColor = Colors.lightGreen;

  @override
  Widget build(BuildContext context) {
    StemWidth(widget.levelStem);
    return Row(
      children: [
        Expanded(
          child: Container(
            child: IconButton(
              onPressed:
                  () {} /*=> setState(() {
                stemData.add(StemData(
                    typeStem: 0,
                    gradeStem: widget.gradeStem + 1,
                    levelStem: 1));
              })*/
              ,
              icon: const Icon(
                Icons.arrow_upward_rounded,
                size: 25,
                color: Colors.green,
              ),
            ),
            height: 100,
            color: Color.fromARGB(255, 220, 235, 255),
          ),
        ),
        Stack(children: [
          Container(
            height: 100,
            width: 100,
            color: Color.fromARGB(255, 220, 235, 255),
          ),
          Container(
            height: 100,
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                  ),
                ),
                Container(
                  height: 100,
                  width: stemWidth,
                  color: stemColor,
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.lightGreen,
                      color: Color.fromARGB(255, 50, 120, 50),
                      strokeWidth: stemWidth / 3,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            height: 100,
            width: 100,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Icon(
                    Icons.add_box,
                    color: Colors.orange,
                    size: 20,
                  ),
                  Text(
                    Thousand(CalcPrice(widget.levelStem, widget.gradeStem)),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Ур. ' + widget.levelStem.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 0.9,
                    ),
                  ),
                  Text(
                    '+' +
                        Thousand(
                            CalcMining(widget.levelStem, widget.gradeStem)),
                    style: const TextStyle(
                      fontSize: 10,
                      height: 0.9,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            child: IconButton(
              splashColor: Colors.red,
              onPressed: () => setState(() {
                widget.levelStem++;
              }),
              icon: const Icon(
                Icons.ac_unit_outlined,
                size: 40,
                color: Colors.transparent,
              ),
            ),
          ),
        ]),
        Expanded(
          child: Container(
            height: 100,
            color: Color.fromARGB(255, 220, 235, 255),
          ),
        ),
      ],
    );
  }

  StemWidth(int levelStem) {
    stemWidth = 0.0;
    if (levelStem >= 1 && levelStem < 25) {
      stemColor = Colors.lightGreen;
    } else if (levelStem >= 25 && levelStem < 50) {
      stemColor = Colors.green;
    } else if (levelStem >= 50 && levelStem < 75) {
      stemColor = Color.fromARGB(255, 72, 118, 72);
    } else if (levelStem >= 75 && levelStem < 100) {
      stemColor = Color.fromARGB(255, 126, 110, 95);
    } else if (levelStem >= 100 && levelStem < 150) {
      stemColor = Color.fromARGB(255, 152, 91, 50);
    } else if (levelStem >= 150 && levelStem < 200) {
      stemColor = Color.fromARGB(255, 205, 36, 36);
    } else
      stemColor = Color.fromARGB(126, 33, 207, 251);

    if (levelStem < 200) {
      stemWidth = 5.0 + levelStem / 4;
    } else
      stemWidth = 60.0;
  }
}
