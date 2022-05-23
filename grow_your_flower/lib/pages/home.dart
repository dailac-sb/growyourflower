import 'package:flutter/material.dart';

class _HomeButton {
  final String name;
  final String adress;

  _HomeButton({
    required this.name,
    required this.adress,
  });
}

class HomePage extends StatelessWidget {
  final List<_HomeButton> homeButtonsData = [
    _HomeButton(name: 'Start glow', adress: '/glow'),
    _HomeButton(name: 'My garden', adress: '/'), //TODO-сделать сад
    _HomeButton(name: 'Botanic', adress: '/'), //TODO-наука
    _HomeButton(name: 'Statistic', adress: '/'), //TODO-статистика
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> listHomeButtons = homeButtonsData
        .map((_HomeButton homeButton) =>
            OneButton(name: homeButton.name, adress: homeButton.adress))
        .toList();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 220, 235, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.green,
        shadowColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.green,
            ),
            onPressed: () {
              //TODO-settings
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listHomeButtons,
        ),
      ),
    );
  }
}

class OneButton extends StatelessWidget {
  final String name;
  final String adress;
  OneButton({
    Key? key,
    required this.name,
    required this.adress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        child: Text(name),
        style: ElevatedButton.styleFrom(
            primary: Colors.green,
            padding: EdgeInsets.all(5),
            minimumSize: Size(160, 40)),
        onPressed: (() {
          Navigator.pushNamed(context, adress, arguments: name);
        }),
      ),
    );
  }
}
