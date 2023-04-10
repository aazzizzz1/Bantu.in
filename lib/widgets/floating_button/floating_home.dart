import 'package:flutter/material.dart';

class FloatingButtonHome extends StatelessWidget {
  final Function onPressed;

  FloatingButtonHome({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => onPressed(),
      child: Icon(Icons.add),
    );
  }
}