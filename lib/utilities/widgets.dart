// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'constants.dart';

class ClipContainer extends StatelessWidget {
  const ClipContainer({
    Key? key,
    required Color colorContainer,
    required this.text,
  })  : _colorContainer = colorContainer,
        super(key: key);

  final Color _colorContainer;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 150,
        color: _colorContainer,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}

class TestContainer extends StatefulWidget {
  final Color color;
  const TestContainer({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  State<TestContainer> createState() => _TestContainerState();
}

class _TestContainerState extends State<TestContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 110,
          color: widget.color,
        ),
      ),
    );
  }
}


class ForecastTile extends StatelessWidget {
  const ForecastTile({
    Key? key, required this.date, required this.temp, required this.dayOfWeek,
  }) : super(key: key);
  final String date;
  final String temp;
  final String dayOfWeek;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 100,
      width: 335,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 250,
          color: Color.fromRGBO(255, 255, 255, 0.280),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      dayOfWeek,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      date,
                      style: kDateStyleY,
                    )
                  ],
                ),
              ),
              Text(
                '$temp°C',
                style: kTempStyleX,
              ),
              Container(
                  padding: EdgeInsets.only(right: 15),
                  height: 30,
                  child: Image.asset(
                      'images/cloud-with-lightning-and-rain.png'))
            ],
          ),
        ),
      ),
    );
  }
}
