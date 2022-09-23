import 'package:flutter/material.dart';
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
    Key? key, required this.color,
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

