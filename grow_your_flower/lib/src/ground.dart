import 'package:flutter/material.dart';
import 'package:grow_your_flower/src/groundblock.dart';

class InfoData {
  final String iconValue;
  double currentValue;
  double globalValue;

  InfoData({
    required this.iconValue,
    required this.currentValue,
    required this.globalValue,
  });
}

class Ground extends StatelessWidget {
  const Ground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        Container(
          color: Color.fromARGB(255, 125, 50, 30),
        ),
        InfoBlock(),
      ]),
    );
  }
}

class InfoBlock extends StatelessWidget {
  List<InfoData> infoData = [
    InfoData(iconValue: 'spa', currentValue: 0.0, globalValue: 0.0),
    InfoData(iconValue: 'group_work', currentValue: 0.0, globalValue: 0.0),
    InfoData(iconValue: 'stars', currentValue: 0.0, globalValue: 0.0),
    InfoData(iconValue: 'local_florist', currentValue: 0.0, globalValue: 0.0),
  ];
  InfoBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> listInfoData = infoData
        .map((InfoData info) => GroundBlock(
            iconValue: info.iconValue,
            currentValue: info.currentValue,
            globalValue: info.globalValue))
        .toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: listInfoData,
    );
  }
}
