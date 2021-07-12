import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/Color.dart';

class SettingScreen extends StatefulWidget {
  final double slideVal;

  SettingScreen({
    required this.slideVal,
  });

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double slideVal = 10000;

  @override
  void initState() {
    super.initState();

    this.slideVal = widget.slideVal;
  }

  renderBody(){
    return Expanded(
      child: Row(
        children: this
            .slideVal
            .toInt()
            .toString()
            .split('')
            .map(
              (x) => Image.asset(
            'asset/$x.png',
            width: 50.0,
            height: 70.0,
          ),
        )
            .toList(),
      ),
    );
  }

  renderSlider(){
    return Container(
      height: 60.0,
      child: Slider(
        min: 10000,
        max: 10000000,
        value: slideVal,
        onChanged: (double val) {
          setState(() {
            slideVal = val;
          });
        },
      ),
    );
  }

  renderButton(){
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: RED_COLOR,
              ),
              onPressed: () {
                Navigator.of(context).pop(this.slideVal.toInt());
              },
              child: Text(
                'SAVE',
              ),
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
        child: Column(
          children: [
            renderBody(),
            renderSlider(),
            renderButton(),
          ],
        ),
      ),
    );
  }
}
