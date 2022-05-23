import 'dart:async';
import 'package:flutter/material.dart';

final keyGroundBlock = GlobalKey<_GroundBlockState>();
double counterValue = 0.0;

class GroundBlock extends StatefulWidget {
  final String iconValue;
  double currentValue;
  double globalValue;

  GroundBlock({
    Key? key,
    required this.iconValue,
    required this.currentValue,
    required this.globalValue,
  }) : super(key: key);

  @override
  State<GroundBlock> createState() => _GroundBlockState();
}

class _GroundBlockState extends State<GroundBlock> {
  Timer? periodicTimer;
  @override
  initState() {
    if (widget.iconValue == 'spa') {
      // super.initState();
      keyGroundBlock.currentState?.periodicTimer =
          Timer.periodic(const Duration(seconds: 3), (timer) {
        counterValue = widget.globalValue++;
        print(counterValue);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width / 4,
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.spa,
                    color: Colors.white,
                  ),
                  Text(
                    counterValue.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  Text(
                    '+' + widget.currentValue.toString(),
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // StartTimer() {
  //   print(widget.iconValue);
  //   if (widget.iconValue == 'spa') {

  //   }
  // }
}
