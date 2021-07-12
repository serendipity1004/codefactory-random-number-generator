import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/Color.dart';
import 'dart:math';

import 'package:random_number_generator/screen/SettingScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [];
  int maxNumber = 10000;

  @override
  void initState() {
    super.initState();

    getRandomNumbers();
  }

  getRandomNumbers() {
    final rand = new Random();

    final List<int> tempNumbers = [];

    while (tempNumbers.length != 3) {
      final number = rand.nextInt(maxNumber);

      tempNumbers.add(number);
    }

    setState(() {
      randomNumbers = tempNumbers;
    });
  }

  renderTitle(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Random Number',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            IconButton(
              onPressed: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SettingScreen(
                      slideVal: this.maxNumber.toDouble(),
                    ),
                  ),
                );

                setState(() {
                  this.maxNumber = result;
                });
              },
              splashRadius: 20.0,
              icon: Icon(
                Icons.settings,
                color: RED_COLOR,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Generator',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }

  renderBody(){
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: this
            .randomNumbers
            .asMap()
            .entries
            .map(
              (x) => Padding(
            padding: EdgeInsets.only(
                bottom: x.key == this.randomNumbers.length - 1
                    ? 0
                    : 16.0),
            child: Row(
              children: x.value
                  .toString()
                  .split('')
                  .map(
                    (y) => Image.asset(
                  'asset/$y.png',
                  height: 70.0,
                  width: 50.0,
                ),
              )
                  .toList(),
            ),
          ),
        )
            .toList(),
      ),
    );
  }

  renderButton(){
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: RED_COLOR,
            ),
            onPressed: this.getRandomNumbers,
            child: Text(
              'RANDOM NUMBER',
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              renderTitle(),
              renderBody(),
              renderButton(),
            ],
          ),
        ),
      ),
    );
  }
}
