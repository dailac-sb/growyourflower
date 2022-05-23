import 'package:flutter/material.dart';
import 'package:grow_your_flower/src/ground.dart';
import 'package:grow_your_flower/src/stem.dart';

class GlowPage extends StatelessWidget {
  const GlowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 235, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.green,
        shadowColor: Colors.transparent,
      ),
      body: Center(
        child: ListView(
          clipBehavior: Clip.none,
          reverse: true,
          children: [
            Ground(),
            Stem(),
            Container(
              height: MediaQuery.of(context).size.height,
              color: const Color.fromARGB(255, 220, 235, 255),
            ),
          ],
        ),
      ),
    );
  }
}
